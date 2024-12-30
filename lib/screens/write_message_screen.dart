import 'package:flutter/material.dart';

class WriteMessageScreen extends StatefulWidget {
  final String contact;

  WriteMessageScreen({required this.contact});

  @override
  _WriteMessageScreenState createState() => _WriteMessageScreenState();
}

class _WriteMessageScreenState extends State<WriteMessageScreen> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menulis Pesan ke ${widget.contact}'),
        backgroundColor: Color(0xFF0088CC),
        elevation: 0, // Menghilangkan shadow
      ),
      body: Column(
        children: [
          // Area input pesan
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _messageController,
                maxLines: null, // Agar bisa multiline
                decoration: InputDecoration(
                  hintText: 'Ketik pesan...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          // Tombol kirim pesan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Tombol kirim dengan ikon
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFF0088CC), size: 28),
                  onPressed: () {
                    String message = _messageController.text;
                    if (message.isNotEmpty) {
                      // Mengirim pesan dan kembali ke ChatScreen
                      Navigator.pop(
                          context, message); // Mengirim pesan ke ChatScreen
                    }
                  },
                ),
                // Kosongkan ruang agar tombol kirim terletak di sebelah kanan
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
