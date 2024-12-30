import 'package:flutter/material.dart';
import 'package:telegram/screens/chat_screen.dart';
import 'package:telegram/screens/write_message_screen.dart';

class NewMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> contacts = [
      'Andi',
      'Siti',
      'Budi',
      'Dewi',
      'Rudi',
    ]; // Daftar kontak

    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Kontak'),
        backgroundColor: Color(0xFF0088CC),
        elevation: 0, // Menghilangkan shadow
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF0088CC),
              child: Text(
                contacts[index][0], // Menampilkan huruf pertama nama
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              contacts[index],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onTap: () {
              // Arahkan ke halaman menulis pesan setelah memilih kontak
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WriteMessageScreen(contact: contacts[index]),
                ),
              ).then((message) {
                if (message != null) {
                  // Jika ada pesan yang dikirim, tambahkan ke ChatScreen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                }
              });
            },
          );
        },
      ),
    );
  }
}
