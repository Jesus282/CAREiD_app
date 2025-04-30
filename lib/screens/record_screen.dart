import 'package:flutter/material.dart';

class DocumentListScreen extends StatelessWidget {
  final List<String> documentTitles = List.generate(20, (i) => 'Documento ${i + 1}');

  List<Color> generateBlueGradient(int count) {
    return List<Color>.generate(count, (index) {
      final t = index / (count - 1 == 0 ? 1 : count - 1); // evita división entre cero
      return Color.lerp(
        Color(0xFFE0F7FA), // azul muy claro
        Color(0xFF0288D1), // azul fuerte
        t,
      )!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = generateBlueGradient(documentTitles.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archivos Subidos'),
        backgroundColor: const Color.fromARGB(255, 129, 221, 224),
      ),
      body: ListView.builder(
        itemCount: documentTitles.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Text(
              documentTitles[index],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
