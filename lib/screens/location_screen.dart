import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';
import 'package:login/screens/BaseScreen.dart';// Asegúrate que esta ruta es correcta

class MedicalMapScreen extends StatefulWidget {
const MedicalMapScreen({super.key});

@override
State<MedicalMapScreen> createState() => _MedicalMapScreenState();
}

class _MedicalMapScreenState extends State<MedicalMapScreen> {
late final MapController _mapController;
List<Marker> _medicalMarkers = [];
LatLng? _userLocation;
bool _isLoading = true;
bool _isMapReady = false;
final scaffoldKey = GlobalKey<ScaffoldState>();

@override
void initState() {
super.initState();
_mapController = MapController();
_initLocation();
}

Future<void> _initLocation() async {
await _getUserLocation();
if (_userLocation != null) {
_getNearbyMedicalFacilities();
}
}

Future<void> _getUserLocation() async {
try {
bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
if (!serviceEnabled) {
bool enabled = await Geolocator.openLocationSettings();
if (!enabled) throw Exception('Servicios de ubicación no disponibles');
}

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Permisos de ubicación denegados');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Permisos de ubicación permanentemente denegados');
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
  );

  setState(() {
    _userLocation = LatLng(position.latitude, position.longitude);
  });

  if (_isMapReady) {
    _moveToLocation(_userLocation!, zoom: 13);
  }
} catch (e) {
  _showErrorSnackbar('Error al obtener ubicación: ${e.toString()}');
} finally {
  if (mounted) {
    setState(() => _isLoading = false);
  }
}
}

Future<void> _getNearbyMedicalFacilities() async {
if (_userLocation == null) return;

setState(() => _isLoading = true);

try {
  final connectivity = await Connectivity().checkConnectivity();
  if (connectivity == ConnectivityResult.none) {
    throw Exception('Sin conexión a Internet');
  }

  final apiKey = 'pk.eyJ1IjoiamVzdXMyNiIsImEiOiJjbWEwd2x4ZmowMThoMmpweXU5YTVudnUyIn0.r9zqvJaVg_p1r1g7jQthcg';
  final proximity = '${_userLocation!.longitude},${_userLocation!.latitude}';
  final limit = 20;
  final country = 'mx';
  final category = 'hospital';

  final url = Uri.parse(
    'https://api.mapbox.com/search/searchbox/v1/category/$category'
    '?access_token=$apiKey'
    '&proximity=$proximity'
    '&limit=$limit'
    '&country=$country',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final seen = <String>{};

    setState(() {
      _medicalMarkers = (data['features'] as List).where((feature) {
        final id = feature['properties']['id'] ?? '';
        return seen.add(id);
      }).map((feature) {
        final coords = feature['geometry']['coordinates'];
        final properties = feature['properties'];
        final name = properties['name'] ?? 'Centro Médico';

        return Marker(
          point: LatLng(coords[1], coords[0]),
          width: 80,
          height: 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_hospital, color: Colors.red, size: 40),
              Flexible(child: Text(name, style: const TextStyle(fontSize: 12))),
            ],
          ),
        );
      }).toList();
    });

    if (_medicalMarkers.isNotEmpty && _userLocation != null && _isMapReady) {
      _adjustMapToMarkers();
    }
  } else {
    throw Exception('Error HTTP ${response.statusCode}');
  }
} catch (e) {
  _showErrorSnackbar('Error al buscar hospitales: ${e.toString()}');
} finally {
  if (mounted) {
    setState(() => _isLoading = false);
  }
}
}

void _moveToLocation(LatLng location, {double zoom = 13}) {
if (_isMapReady) {
_mapController.move(location, zoom);
}
}

void _adjustMapToMarkers() {
final bounds = LatLngBounds.fromPoints([_userLocation!, ..._medicalMarkers.map((m) => m.point)]);
final center = bounds.center;
final zoom = _calculateZoomLevel(bounds);
_moveToLocation(center, zoom: zoom);
}

double _calculateZoomLevel(LatLngBounds bounds) {
const double minZoom = 10.0;
const double maxZoom = 16.0;
final distance = const Distance().distance(bounds.northWest, bounds.southEast);

if (distance > 10000) return minZoom;
if (distance > 5000) return 11.0;
if (distance > 2000) return 12.0;
if (distance > 1000) return 13.0;
if (distance > 500) return 14.0;
if (distance > 200) return 15.0;
return maxZoom;
}

void _showErrorSnackbar(String message) {
if (mounted) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(message),
duration: const Duration(seconds: 3),
),
);
}
}

@override
Widget build(BuildContext context) {
return BaseScreen(
scaffoldKey: scaffoldKey,
currentIndex: 1,
title: 'Centros Médicos Cercanos',
body: _isLoading
? const Center(child: CircularProgressIndicator())
: Stack(
children: [
FlutterMap(
mapController: _mapController,
options: MapOptions(
initialCenter: _userLocation ?? const LatLng(19.4326, -99.1332),
initialZoom: 13,
onMapReady: () {
setState(() => _isMapReady = true);
if (_userLocation != null) {
_moveToLocation(_userLocation!);
}
},
),
children: [
TileLayer(
urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiamVzdXMyNiIsImEiOiJjbWEwd2x4ZmowMThoMmpweXU5YTVudnUyIn0.r9zqvJaVg_p1r1g7jQthcg',
userAgentPackageName: 'com.example.careid',
),
MarkerLayer(markers: _medicalMarkers),
if (_userLocation != null)
MarkerLayer(
markers: [
Marker(
point: _userLocation!,
width: 60,
height: 60,
child: const Column(
children: [
Icon(Icons.person_pin_circle, color: Colors.blue, size: 40),
Text('Tú', style: TextStyle(fontSize: 12)),
],
),
),
],
),
],
),
if (_medicalMarkers.isEmpty && !_isLoading)
const Center(
child: Card(
child: Padding(
padding: EdgeInsets.all(16),
child: Text('No se encontraron centros médicos cercanos'),
),
),
),
],
),
);
}

@override
void dispose() {
_mapController.dispose();
super.dispose();
}
}