import 'package:flutter/material.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({Key? key}) : super(key: key);

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> familiares = [
    {'nombre': 'Carlos Gómez', 'telefono': '555-1234', 'email': 'carlos@gmail.com'},
    {'nombre': 'Ana Torres', 'telefono': '555-5678', 'email': 'ana@hotmail.com'},
    {'nombre': 'Lucía Pérez', 'telefono': '555-8765', 'email': 'lucia@yahoo.com'},
  ];

  List<Map<String, String>> familiaresFiltrados = [];

  @override
  void initState() {
    super.initState();
    familiaresFiltrados = familiares;
  }

  void _buscarFamiliares(String query) {
    setState(() {
      familiaresFiltrados = familiares
          .where((familiar) => familiar['nombre']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _agregarFamiliar() {
    setState(() {
      familiares.add({
        'nombre': 'Nuevo Familiar ${familiares.length + 1}',
        'telefono': '555-000${familiares.length}',
        'email': 'nuevo${familiares.length}@email.com'
      });
      familiaresFiltrados = familiares;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Familiar agregado exitosamente')),
    );
  }

  void _eliminarFamiliar(int index) {
    String nombre = familiaresFiltrados[index]['nombre']!;
    setState(() {
      familiares.remove(familiaresFiltrados[index]);
      familiaresFiltrados = familiares;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Familiar $nombre eliminado')),
    );
  }

  void _enviarMensaje(String nombre) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Mensaje enviado a $nombre')),
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
        title: const Text('Familiares'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar familiar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              onChanged: _buscarFamiliares,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: familiaresFiltrados.length,
              itemBuilder: (context, index) {
                var familiar = familiaresFiltrados[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(familiar['nombre']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Teléfono: ${familiar['telefono']}'),
                        Text('Email: ${familiar['email']}'),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Eliminar') {
                          _eliminarFamiliar(index);
                        } else if (value == 'Mensaje') {
                          _enviarMensaje(familiar['nombre']!);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'Mensaje',
                          child: Text('Enviar Mensaje'),
                        ),
                        const PopupMenuItem(
                          value: 'Eliminar',
                          child: Text('Eliminar Familiar'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _agregarFamiliar,
        child: const Icon(Icons.person_add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
