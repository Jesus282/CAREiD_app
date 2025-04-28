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
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });

    _getNearbyMedicalFacilities();
  }

  Future<void> _getNearbyMedicalFacilities() async {
    final placesService = GeoCoding(
      apiKey: 'pk.eyJ1IjoiamVzdXMyNiIsImEiOiJjbWEwd2x4ZmowMThoMmpweXU5YTVudnUyIn0.r9zqvJaVg_p1r1g7jQthcg',
      country: 'mx',
      limit: 20,
    );

    try {
      var results = await placesService.getPlaces(
        'hospital',
        proximity: Proximity.LatLong(
          lat: _userLocation!.latitude,
          long: _userLocation!.longitude,
        ),
      );

      setState(() {
        _medicalMarkers = (results.success ?? []).map((place) {
          return Marker(
            width: 40.0,
            height: 40.0,
            point: LatLng(
              place.geometry?.coordinates[1] ?? 0, // latitude
              place.geometry?.coordinates[0] ?? 0, // longitude
            ),
            child: const Icon(
              Icons.local_hospital,
              color: Colors.red,
              size: 40,
            ),
          );
        }).toList();
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
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/{z}/{x}/{y}?access_token=TU_API_KEY',
                  additionalOptions: {
                    'accessToken': 'TU_API_KEY',
                    'id': 'mapbox.streets',
                  },
                  userAgentPackageName: 'com.example.careid',
                ),
                MarkerLayer(
                  markers: [
                    if (_userLocation != null)
                      Marker(
                        width: 50.0,
                        height: 50.0,
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
