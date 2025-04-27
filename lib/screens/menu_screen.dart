import 'package:flutter/material.dart';

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

  void _navigateTo(String screenName) {
  String route = '';

  switch (screenName) {
    case 'Editar Perfil de Usuario':
      route = '/perfil';
      break;
    case 'Cambiar de Cuenta':
      route = '/contacto';
      break;
    case 'Ver y Contactar con Familia':
      route = '/familia';
      break;
    case 'Mis Documentos':
      route = '/clinicas';
      break;
    case 'Mis Recordatorios':
      route = '/alarma';
      break;
    case 'Ayuda y Asistencia':
      route = '/ayuda';
      break;
    case 'Configuraciones Generales':
      route = '/configuracion';
      break;
    default:
      return;
  }

  if (route.isNotEmpty) {
    Navigator.pushNamed(context, route);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menú CAREiD',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Editar perfil de usuario'),
              onTap: () => _navigateTo('Editar Perfil de Usuario'),
            ),
            ListTile(
              leading: const Icon(Icons.switch_account),
              title: const Text('Cambiar de cuenta'),
              onTap: () => _navigateTo('Cambiar de Cuenta'),
            ),
            ListTile(
              leading: const Icon(Icons.family_restroom),
              title: const Text('Ver y contactar con familia'),
              onTap: () => _navigateTo('Ver y Contactar con Familia'),
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('Mis documentos'),
              onTap: () => _navigateTo('Mis Documentos'),
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active),
              title: const Text('Mis recordatorios'),
              onTap: () => _navigateTo('Mis Recordatorios'),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Ayuda y asistencia'),
              onTap: () => _navigateTo('Ayuda y Asistencia'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuraciones generales'),
              onTap: () => _navigateTo('Configuraciones Generales'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('CAREiD'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.blue[50],
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
                      // Acción de editar cita
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addAppointment,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 35),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Aquí podemos cambiar de pantalla dependiendo de index más adelante
          });
        },
      ),
    );
  }
}
