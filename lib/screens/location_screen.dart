import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicalMapScreen extends StatefulWidget {
  const MedicalMapScreen({super.key});

  @override
  State<MedicalMapScreen> createState() => _MedicalMapScreenState();
}

class _MedicalMapScreenState extends State<MedicalMapScreen> {
  final MapController _mapController = MapController();
  List<Marker> _medicalMarkers = [];
  LatLng? _userLocation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool enabled = await Geolocator.openLocationSettings();
      if (!enabled) {
        setState(() => _isLoading = false);
        return;
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _isLoading = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });

      await _getNearbyMedicalFacilities();
    } catch (e) {
      print('Error obteniendo ubicación: $e');
      setState(() => _isLoading = false);
      _showErrorSnackbar('Error al obtener ubicación: ${e.toString()}');
    }
  }

  Future<void> _getNearbyMedicalFacilities() async {
    if (_userLocation == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
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
        '&country=$country'
      );

      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        setState(() {
          _medicalMarkers = (data['features'] as List).map((feature) {
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
                  Text(name, style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          }).toList();
          
          _isLoading = false;
          
          // Ajustar el mapa para mostrar todos los marcadores
          if (_medicalMarkers.isNotEmpty && _userLocation != null) {
            final bounds = LatLngBounds.fromPoints(
              [_userLocation!, ..._medicalMarkers.map((m) => m.point)]
            );
            final center = bounds.center;
            final zoom = 13.0; // Adjust zoom level as needed
            _mapController.move(center, zoom);
          }
        });
      } else {
        throw Exception('Error HTTP ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('Error en Category Search: $e');
      setState(() => _isLoading = false);
      _showErrorSnackbar('Error al buscar hospitales: ${e.toString()}');
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centros Médicos Cercanos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () {
              setState(() => _isLoading = true);
              _getUserLocation();
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() => _isLoading = true);
              _getNearbyMedicalFacilities();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _userLocation ?? const LatLng(19.4326, -99.1332),
                    initialZoom: 13,
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
}