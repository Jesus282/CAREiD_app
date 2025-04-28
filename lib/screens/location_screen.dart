import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_search/mapbox_search.dart';

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
      if (!enabled) return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });

      _getNearbyMedicalFacilities();
    } catch (e) {
      print('Error obteniendo ubicación: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getNearbyMedicalFacilities() async {
    if (_userLocation == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      final placesService = PlacesSearch(
        apiKey: 'pk.eyJ1IjoiamVzdXMyNiIsImEiOiJjbWEwd2x4ZmowMThoMmpweXU5YTVudnUyIn0.r9zqvJaVg_p1r1g7jQthcg',
      );

      final response = await placesService.getPlaces(
        'hospital',
        proximity: Location(
          lat: _userLocation!.latitude,
          lng: _userLocation!.longitude,
        ),
        country: 'mx',
        limit: 20,
      );

      setState(() {
        _medicalMarkers = response.features?.map((place) {
          return Marker(
            point: LatLng(
              place.center?[1] ?? 0, // latitude
              place.center?[0] ?? 0, // longitude
            ),
            child: const Icon(
              Icons.local_hospital,
              color: Colors.red,
              size: 40,
            ),
          );
        }).toList() ?? [];
        
        _isLoading = false;
      });

      if (_userLocation != null) {
        _mapController.move(_userLocation!, 13);
      }
    } catch (e) {
      print('Error al obtener centros médicos: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centros Médicos Cercanos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _getUserLocation,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
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
                MarkerLayer(
                  markers: [
                    if (_userLocation != null)
                      Marker(
                        point: _userLocation!,
                        child: const Icon(
                          Icons.person_pin_circle,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                    ..._medicalMarkers,
                  ],
                ),
              ],
            ),
    );
  }
}