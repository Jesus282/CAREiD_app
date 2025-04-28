import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> contacts = const [
    {'name': 'Dr. Juan Pérez', 'type': 'Especialista'},
    {'name': 'Dra. María López', 'type': 'Especialista'},
    {'name': 'Papá', 'type': 'Familiar'},
    {'name': 'Mamá', 'type': 'Familiar'},
    {'name': 'Hermano', 'type': 'Familiar'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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

  const ChatConversationScreen({Key? key, required this.name, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                // Aquí irían los mensajes intercambiados (mocked de momento)
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
                    // Aquí iría la lógica de enviar el mensaje
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
