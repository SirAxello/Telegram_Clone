import 'package:flutter/material.dart';
import 'package:telegram/screens/write_message_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = []; // Menyimpan daftar pesan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Color(0xFF0088CC),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(messages[index]),
            onTap: () {
              // Navigasi ke layar menulis pesan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WriteMessageScreen(contact: 'Kontak'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman menulis pesan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WriteMessageScreen(contact: 'Kontak'),
            ),
          );
        },
        backgroundColor: Color(0xFF0088CC),
        mini: true,
        child: Icon(Icons.edit, size: 20),
      ),
    );
  }

  void _addMessage(String message) {
    setState(() {
      messages.add(message); // Menambahkan pesan ke daftar
    });
  }
}
