import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_screen.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final FloatingActionButton? floatingActionButton;
  final String? title;

  const BaseScreen({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.scaffoldKey,
    this.floatingActionButton,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: _buildDrawer(context),
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  /// AppBar personalizado con fuente y colores definidos
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        title ?? 'CAREiD',
        style: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFFE3F2FD),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black54),
          onPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ],
    );
  }

  /// Cuerpo de la pantalla con fondo desenfocado
  Widget _buildBody() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: 0.15,
          child: Image.asset(
            'fondo.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: body,
        ),
      ],
    );
  }

  /// Navegación inferior
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFBBDEFB),
      selectedItemColor: const Color(0xFF1976D2),
      unselectedItemColor: Colors.black45,
      currentIndex: currentIndex,
      showUnselectedLabels: false,
      onTap: (index) => _onNavTap(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Mapas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_open),
          label: 'Documentos',
        ),
      ],
    );
  }

  void _onNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        _navigateTo(context, '/menu');
        break;
      case 1:
        _navigateTo(context, '/location');
        break;
      case 2:
        // Aquí pasamos el parámetro correctamente al navegar al chat
        _navigateTo(context, '/chat', arguments: {'receiverName': 'nombre del receptor'});
        break;
      case 3:
        _navigateTo(context, '/historial');
        break;
    }
  }

  /// Drawer lateral con items organizados
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF1F8E9),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF81D4FA),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Text(
              'CAREiD',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ..._drawerItems(context),
        ],
      ),
    );
  }

  List<Widget> _drawerItems(BuildContext context) {
    const drawerOptions = [
      ['Editar perfil de usuario', Icons.edit, '/perfil'],
      ['Cambiar de cuenta', Icons.switch_account, '/contacto'],
      ['Ver y contactar con familia', Icons.family_restroom, '/familia'],
      ['Mis documentos', Icons.folder, '/registroclinico'],
      ['Mis recordatorios', Icons.notifications_active, '/alarma'],
      ['Calendario', Icons.calendar_today, '/calendario'],
      ['Ayuda y asistencia', Icons.help_outline, '/ayuda'],
      ['Configuraciones generales', Icons.settings, '/configuracion'],
    ];

    return drawerOptions.map((option) {
      final title = option[0] as String;
      final icon = option[1] as IconData;
      final route = option[2] as String;

      return ListTile(
        leading: Icon(icon, color: Colors.teal[700]),
        title: Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () => _navigateTo(context, route),
      );
    }).toList();
  }

  void _navigateTo(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }
}
