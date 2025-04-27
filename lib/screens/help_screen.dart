import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> temasAyuda = [
    {'titulo': 'Cómo usar la aplicación', 'descripcion': 'Manual paso a paso para nuevos usuarios.'},
    {'titulo': 'Recuperar contraseña', 'descripcion': 'Guía para recuperar tu cuenta de manera segura.'},
    {'titulo': 'Contactar soporte', 'descripcion': 'Instrucciones para solicitar asistencia técnica.'},
    {'titulo': 'Configuración de notificaciones', 'descripcion': 'Ajustes para recibir alertas importantes.'},
    {'titulo': 'Privacidad y seguridad', 'descripcion': 'Información sobre protección de datos personales.'},
    {'titulo': 'Eliminar cuenta', 'descripcion': 'Procedimiento para cerrar tu cuenta permanentemente.'},
  ];

  List<Map<String, String>> temasFiltrados = [];

  @override
  void initState() {
    super.initState();
    temasFiltrados = temasAyuda;
  }

  void _buscarTema(String query) {
    setState(() {
      temasFiltrados = temasAyuda.where((tema) {
        return tema['titulo']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _verTema(String titulo) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Visualizando: $titulo')),
    );
    // Más adelante aquí se podría navegar a una pantalla de detalle
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda y Asistencia'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar ayuda...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: _buscarTema,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: temasFiltrados.length,
              itemBuilder: (context, index) {
                var tema = temasFiltrados[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.blueAccent, size: 40),
                    title: Text(tema['titulo']!),
                    subtitle: Text(tema['descripcion']!),
                    onTap: () => _verTema(tema['titulo']!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
