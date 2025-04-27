import 'package:flutter/material.dart';

class ClinicListScreen extends StatefulWidget {
  const ClinicListScreen({Key? key}) : super(key: key);

  @override
  State<ClinicListScreen> createState() => _ClinicListScreenState();
}

class _ClinicListScreenState extends State<ClinicListScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  List<Map<String, String>> documentosMedicos = [
    {'nombre': 'Consulta General - Enero 2025', 'fecha': '2025-01-15'},
    {'nombre': 'Chequeo Cardiológico - Diciembre 2024', 'fecha': '2024-12-20'},
    {'nombre': 'Radiografía Torácica - Noviembre 2024', 'fecha': '2024-11-10'},
    {'nombre': 'Análisis de Sangre - Octubre 2024', 'fecha': '2024-10-05'},
    {'nombre': 'Examen de Vista - Septiembre 2024', 'fecha': '2024-09-12'},
  ];

  List<Map<String, String>> documentosFiltrados = [];

  @override
  void initState() {
    super.initState();
    documentosFiltrados = documentosMedicos;
  }

  void _buscarDocumento(String query) {
    setState(() {
      documentosFiltrados = documentosMedicos.where((doc) {
        return doc['nombre']!.toLowerCase().contains(query.toLowerCase()) ||
               doc['fecha']!.contains(query);
      }).toList();
    });
  }

  void _visualizarDocumento(String nombre) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Visualizando: $nombre')),
    );
  }

  void _descargarDocumento(String nombre) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Descargando: $nombre')),
    );
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
        title: const Text('Documentos Médicos'),
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
                hintText: 'Buscar por nombre o fecha...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              onChanged: _buscarDocumento,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: documentosFiltrados.length,
              itemBuilder: (context, index) {
                var documento = documentosFiltrados[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const Icon(Icons.folder_copy, color: Colors.blue, size: 40),
                    title: Text(documento['nombre']!),
                    subtitle: Text('Fecha: ${documento['fecha']}'),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Visualizar') {
                          _visualizarDocumento(documento['nombre']!);
                        } else if (value == 'Descargar') {
                          _descargarDocumento(documento['nombre']!);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'Visualizar',
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem(
                          value: 'Descargar',
                          child: Text('Descargar'),
                        ),
                      ],
                    ),
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
