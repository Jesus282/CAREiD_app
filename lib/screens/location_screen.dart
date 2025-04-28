import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> hospitals = const [
    {
      'name': 'Hospital General Central',
      'address': 'Av. Siempre Viva 123, Ciudad Central'
    },
    {
      'name': 'Clínica Médica Familiar',
      'address': 'Calle Salud 456, Zona Norte'
    },
    {
      'name': 'Centro de Especialidades Médicas',
      'address': 'Boulevard Médico 789, Distrito Sur'
    },
    {
      'name': 'Hospital de Urgencias 24h',
      'address': 'Av. Rápida 101, Ciudad Nueva'
    },
  ];



  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey, // <- agregado
      currentIndex: 0,
    
      title: 'Hospitales Cercanos',
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          final hospital = hospitals[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: const Icon(Icons.local_hospital, color: Colors.redAccent, size: 40),
              title: Text(
                hospital['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(hospital['address']!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HospitalMapScreen(
                      name: hospital['name']!,
                      address: hospital['address']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HospitalMapScreen extends StatelessWidget {
  final String name;
  final String address;

  HospitalMapScreen({Key? key, required this.name, required this.address}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey, // <- agregado
      currentIndex: 0,
 
      title: name,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.map, size: 100, color: Colors.blueGrey),
            const SizedBox(height: 20),
            Text(
              'Ubicación: $address',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text(
              'Aquí iría un mapa interactivo 🌎 (por integrar)',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
