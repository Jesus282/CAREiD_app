import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';
class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> contacts = const [
    {'name': 'Dr. Juan Pérez', 'type': 'Especialista'},
    {'name': 'Dra. María López', 'type': 'Especialista'},
    {'name': 'Papá', 'type': 'Familiar'},
    {'name': 'Mamá', 'type': 'Familiar'},
    {'name': 'Hermano', 'type': 'Familiar'},
  ];


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey, // ¡obligatorio!
      currentIndex: 0,
      title: 'Chats',
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundColor: contact['type'] == 'Especialista'
                    ? Colors.blueAccent
                    : Colors.green,
                child: Text(
                  contact['name']![0],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              title: Text(contact['name']!),
              subtitle: Text(contact['type']!),
              trailing: const Icon(Icons.chat_bubble_outline),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatConversationScreen(
                      name: contact['name']!,
                      type: contact['type']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChatConversationScreen extends StatelessWidget {
  final String name;
  final String type;

  ChatConversationScreen({Key? key, required this.name, required this.type}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _messageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey,
      currentIndex: 0,
   
      title: name,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Bubble(message: '¡Hola! ¿Cómo puedo ayudarte hoy?'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Bubble(message: 'Tengo algunas dudas sobre mi tratamiento.'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Aquí puedes añadir lógica de envío
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  final String message;

  const Bubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(message),
    );
  }
}
