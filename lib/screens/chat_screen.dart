import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final String receiverName;

  const ChatScreen({super.key, required this.receiverName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendMessage() async {
    final currentUser = _auth.currentUser;
    final text = _messageController.text.trim();
    if (text.isEmpty || currentUser == null) return;

    await FirebaseFirestore.instance.collection('messages').add({
      'text': text,
      'sender': currentUser.email ?? 'Anónimo',
      'receiver': widget.receiverName,
      'Tiempo': FieldValue.serverTimestamp(),
      'read': false, // Para uso futuro de estado "leído"
    });

    _messageController.clear();
  }

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
