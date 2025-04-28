import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';
class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool _modoOscuro = false;
  String _idiomaSeleccionado = 'Español';

  final List<String> _idiomasDisponibles = ['Español', 'Inglés', 'Francés', 'Alemán'];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _cambiarTema(bool valor) {
    setState(() {
      _modoOscuro = valor;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_modoOscuro ? 'Tema oscuro activado' : 'Tema claro activado')),
    );
  }

  void _seleccionarIdioma(String? nuevoIdioma) {
    if (nuevoIdioma != null) {
      setState(() {
        _idiomaSeleccionado = nuevoIdioma;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Idioma cambiado a $_idiomaSeleccionado')),
      );
    }
  }

  void _cerrarSesion() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sesión cerrada exitosamente')),
    );
    // Aquí puedes agregar la navegación a login
  }

  void _onBottomNavTapped(int index) {
    // Aquí manejas la navegación desde el BottomNavigationBar
    print('Se tocó el botón de índice: $index');
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey,
  
      currentIndex: 0, // Puedes cambiarlo si quieres que otro tab esté activo
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 10),
          SwitchListTile(
            title: const Text('Modo Oscuro'),
            value: _modoOscuro,
            onChanged: _cambiarTema,
            secondary: const Icon(Icons.brightness_6),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Idioma'),
            subtitle: Text(_idiomaSeleccionado),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Seleccionar idioma'),
                    content: DropdownButton<String>(
                      value: _idiomaSeleccionado,
                      isExpanded: true,
                      onChanged: (value) {
                        _seleccionarIdioma(value);
                        Navigator.of(context).pop(); // Cerramos el dialogo
                      },
                      items: _idiomasDisponibles.map((idioma) {
                        return DropdownMenuItem(
                          value: idioma,
                          child: Text(idioma),
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Cerrar sesión'),
            onTap: _cerrarSesion,
          ),
        ],
      ),
    );
  }
}
