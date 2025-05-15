import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:login/screens/BaseScreen.dart';

class ChatScreen extends StatefulWidget {
final String receiverName;

const ChatScreen({super.key, required this.receiverName});

@override
State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
final supabase = Supabase.instance.client;
final TextEditingController _messageController = TextEditingController();
final scaffoldKey = GlobalKey<ScaffoldState>();

void _sendMessage() async {
final user = supabase.auth.currentUser;
final text = _messageController.text.trim();
if (text.isEmpty || user == null) return;

await supabase.from('messages').insert({
  'text': text,
  'sender': user.email,
  'receiver': widget.receiverName,
  'created_at': DateTime.now().toIso8601String(),
  'read': false,
});

_messageController.clear();
setState(() {}); // Recarga los mensajes
}

Stream<List<Map<String, dynamic>>> _getMessages() {
final currentUser = supabase.auth.currentUser;
if (currentUser == null) return const Stream.empty();
final myEmail = currentUser.email;

return supabase
    .from('messages')
    .stream(primaryKey: ['id'])
    .order('created_at')
    .map((list) {
      return list.where((msg) =>
        (msg['sender'] == myEmail && msg['receiver'] == widget.receiverName) ||
        (msg['sender'] == widget.receiverName && msg['receiver'] == myEmail)
      ).toList();
    });
}

@override
Widget build(BuildContext context) {
return BaseScreen(
scaffoldKey: scaffoldKey,
currentIndex: 2,
title: 'Chat con ${widget.receiverName}',
body: Column(
children: [
Expanded(
child: StreamBuilder<List<Map<String, dynamic>>>(
stream: _getMessages(),
builder: (context, snapshot) {
if (!snapshot.hasData) {
return const Center(child: CircularProgressIndicator());
}
            final messages = snapshot.data!;
            final currentUserEmail = supabase.auth.currentUser?.email ?? 'yo';

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg['sender'] == currentUserEmail;
                final timestamp = DateTime.tryParse(msg['created_at'] ?? '');
                final timeFormatted = timestamp != null
                    ? DateFormat('hh:mm a').format(timestamp)
                    : 'Enviando...';

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blueAccent : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          msg['text'] ?? '',
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          timeFormatted,
                          style: TextStyle(
                            color: isMe ? Colors.white70 : Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Escribe un mensaje...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: _sendMessage,
            ),
          ],
        ),
      ),
    ],
  ),
);
}
}