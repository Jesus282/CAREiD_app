import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> appointments = [];

  int _currentIndex = 0;

  void _addAppointment() {
    setState(() {
      appointments.add('Nueva cita ${appointments.length + 1}');
    });
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/location');
        break;
      case 2:
        Navigator.pushNamed(context, '/chat');
        break;
      default:
        Navigator.pushReplacementNamed(context, '/menu');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey,
      currentIndex: _currentIndex,
      onBottomNavTapped: _onBottomNavTapped,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.white.withOpacity(0.8),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.calendar_today, color: Colors.white),
              ),
              title: Text(
                appointments[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Detalles de la cita...'),
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/perfilconsulta');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        appointments.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
