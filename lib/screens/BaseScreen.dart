import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final FloatingActionButton? floatingActionButton;
  final String? title;

  const BaseScreen({
    Key? key,
    required this.body,
    required this.currentIndex,
    required this.scaffoldKey,
    this.floatingActionButton,
    this.title,
  }) : super(key: key);

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: _buildDrawer(context),
      appBar: AppBar(
        title: Text(title ?? 'CAREiD'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 184, 210, 255),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'fondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          body,
        ],
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,
        onTap: (index) => _onBottomNavTapped(context, index),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Documentos',
          ),
        ],
      ),
    );
  }

  void _onBottomNavTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        _navigateTo(context, '/menu'); // Página principal
        break;
      case 1:
        _navigateTo(context, '/location'); // Página del mapa
        break;
      case 2:
        _navigateTo(context, '/chat'); // Página de chats
        break;
      case 3:
        _navigateTo(context, '/historial'); // Página de documentos
        break;
    }
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue[50],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 129, 221, 224),
            ),
            child: Text(
              'MENU CAREiD',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.blue),
            title: const Text('Editar perfil de usuario'),
            onTap: () => _navigateTo(context, '/perfil'),
          ),
          ListTile(
            leading: const Icon(Icons.switch_account, color: Colors.blue),
            title: const Text('Cambiar de cuenta'),
            onTap: () => _navigateTo(context, '/contacto'),
          ),
          ListTile(
            leading: const Icon(Icons.family_restroom, color: Colors.blue),
            title: const Text('Ver y contactar con familia'),
            onTap: () => _navigateTo(context, '/familia'),
          ),
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.blue),
            title: const Text('Mis documentos'),
            onTap: () => _navigateTo(context, '/registroclinico'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.blue),
            title: const Text('Mis recordatorios'),
            onTap: () => _navigateTo(context, '/alarma'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.blue),
            title: const Text('Calendario'),
            onTap: () => _navigateTo(context, '/calendario'), // Ruta del calendario
          ),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.blue),
            title: const Text('Ayuda y asistencia'),
            onTap: () => _navigateTo(context, '/ayuda'),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.blue),
            title: const Text('Configuraciones generales'),
            onTap: () => _navigateTo(context, '/configuracion'),
          ),
        ],
      ),
    );
  }
}

