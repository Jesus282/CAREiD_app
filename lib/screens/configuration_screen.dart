import 'package:flutter/material.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool _modoOscuro = false;
  String _idiomaSeleccionado = 'Español';

  final List<String> _idiomasDisponibles = ['Español', 'Inglés', 'Francés', 'Alemán'];

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
    // Aquí puedes agregar la lógica para cerrar sesión y navegar a la pantalla de login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones Generales'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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
                      onChanged: _seleccionarIdioma,
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
