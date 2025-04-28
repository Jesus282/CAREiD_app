import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final Function(int) onBottomNavTapped;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const BaseScreen({
    Key? key,
    required this.body,
    required this.currentIndex,
    required this.onBottomNavTapped,
    required this.scaffoldKey,
  }) : super(key: key);

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue[50],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text(
              'Menú CAREiD',
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
            onTap: () => _navigateTo(context, '/clinicas'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.blue),
            title: const Text('Mis recordatorios'),
            onTap: () => _navigateTo(context, '/alarma'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: _buildDrawer(context),
      appBar: AppBar(
        title: const Text('CAREiD'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
          Image.asset(
            'assets/logo.png', // <-- ruta a tu logo
            fit: BoxFit.cover,
          ),
          body,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,
        onTap: onBottomNavTapped,
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
      ),
    );
  }
}
