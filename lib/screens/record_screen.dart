import 'package:flutter/material.dart';

class DocumentListScreen extends StatefulWidget {
  const DocumentListScreen({super.key});

  @override
  _DocumentListScreenState createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  final List<String> documentTitles = List.generate(20, (i) => 'Documento ${i + 1}');

  List<Color> generateBlueGradient(int count) {
    return List<Color>.generate(count, (index) {
      final t = index / (count - 1 == 0 ? 1 : count - 1); // evita división entre cero
      return Color.lerp(
        Color(0xFFBBDEFB), // Azul claro
        Color(0xFF1976D2), // Azul intenso
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
        backgroundColor: Color(0xFF2196F3), // Azul más vibrante
        elevation: 4,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: documentTitles.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.document_scanner, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    documentTitles[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
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
        backgroundColor: Color(0xFF2196F3), // Azul del fondo
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
