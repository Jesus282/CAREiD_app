import 'package:flutter/material.dart';
import 'chatpersonal.dart';
import 'BaseScreen.dart'; // Asegúrate de importar tu diseño base

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return BaseScreen(
      scaffoldKey: scaffoldKey,
      currentIndex: 2, // Índice del botón "Chat"
      title: 'Conversaciones',
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Contactos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('Admin'),
            subtitle: const Text('Toca para chatear'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ChatScreen(receiverName: 'Admin'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
