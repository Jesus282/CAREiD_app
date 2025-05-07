import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      'timestamp': FieldValue.serverTimestamp(),
      'read': false,
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserEmail = _auth.currentUser?.email ?? 'Anónimo';

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat con ${widget.receiverName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final allMessages = snapshot.data!.docs;

                final messages = allMessages.where((msg) {
                  final sender = msg['sender'];
                  final receiver = msg['receiver'];
                  return (sender == currentUserEmail &&
                          receiver == widget.receiverName) ||
                      (sender == widget.receiverName &&
                          receiver == currentUserEmail);
                }).toList();

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final text = msg['text'] ?? '';
                    final sender = msg['sender'] ?? '';
                    final isMe = sender == currentUserEmail;

                    final Timestamp? timestamp = msg['timestamp'];
                    final dateTime = timestamp?.toDate();
                    final timeFormatted = dateTime != null
                        ? DateFormat('hh:mm a').format(dateTime)
                        : 'Enviando...';

                    // DEBUG
                    print("Mensaje de $sender a ${msg['receiver']}: $text");

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blueAccent : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              text,
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
