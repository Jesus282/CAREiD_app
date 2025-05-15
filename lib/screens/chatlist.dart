
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:login/screens/BaseScreen.dart';
import 'chatpersonal.dart';

class ChatListScreen extends StatefulWidget {
const ChatListScreen({Key? key}) : super(key: key);

@override
State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
final supabase = Supabase.instance.client;
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final List<String> fakeNames = [
'Ana Gómez',
'Carlos Ruiz',
'María Fernández',
'Luis Martínez',
'Sofía Herrera',
'Diego Torres',
'Valentina López',
'Javier Romero',
'Camila Vargas',
'Andrés Navarro',
];

Future<List<Map<String, String>>> _fetchChatUsers() async {
final currentUser = supabase.auth.currentUser;
if (currentUser == null) return [];

final email = currentUser.email;

final response = await supabase.from('messages').select('sender, receiver');
final List data = response;

final Set<String> userEmails = {};

for (var msg in data) {
  if (msg['sender'] != email) userEmails.add(msg['sender']);
  if (msg['receiver'] != email) userEmails.add(msg['receiver']);
}

// Rellenar si hay menos de 5
while (userEmails.length < 5) {
  userEmails.add('usuario${userEmails.length + 1}@ejemplo.com');
}

final List<String> emails = userEmails.toList().take(5).toList();

// Mapear cada email a un nombre real aleatorio
final List<Map<String, String>> result = [];
for (int i = 0; i < emails.length; i++) {
  result.add({
    'name': fakeNames[i % fakeNames.length],
    'email': emails[i],
  });
}

return result;
}

@override
Widget build(BuildContext context) {
return BaseScreen(
scaffoldKey: scaffoldKey,
currentIndex: 2,
title: 'Lista de Chats',
body: FutureBuilder<List<Map<String, String>>>(
future: _fetchChatUsers(),
builder: (context, snapshot) {
if (!snapshot.hasData) {
return const Center(child: CircularProgressIndicator());
}

      final chatList = snapshot.data!;
      return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chatUser = chatList[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(chatUser['name']!),
            subtitle: Text(chatUser['email']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/chat',
                arguments: chatUser['email'],
              );
            },
          );
        },
      );
    },
  ),
);
}
}