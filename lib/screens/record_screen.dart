import 'package:flutter/material.dart';

class DocumentListScreen extends StatefulWidget {
  @override
  _DocumentListScreenState createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
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

  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/menu');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/location');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
    }
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _onBottomNavTapped(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Ubicación',
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
