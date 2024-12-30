import 'package:flutter/material.dart';
import 'dart:math'; // Untuk menghasilkan angka acak

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar nama kontak acak dan status online terakhir
    final List<Map<String, String>> contacts = [
      {'name': 'Andi Pratama', 'status': 'Apa kabar?', 'lastActive': 'Online'},
      {
        'name': 'Budi Santoso',
        'status': 'Sedang sibuk kerja!',
        'lastActive': '5 menit lalu'
      },
      {
        'name': 'Citra Dewi',
        'status': 'Mau ngopi nanti?',
        'lastActive': '15 menit lalu'
      },
      {
        'name': 'Dewi Ayu',
        'status': 'Siap berangkat kerja!',
        'lastActive': 'Online'
      },
      {
        'name': 'Eko Putra',
        'status': 'Bersantai di rumah',
        'lastActive': '2 jam lalu'
      },
      {
        'name': 'Fajar Rizky',
        'status': 'Perjalanan ke kantor',
        'lastActive': '30 menit lalu'
      },
      {
        'name': 'Gita Pertiwi',
        'status': 'Belanja bulanan',
        'lastActive': 'Kemarin'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Kontak"),
        backgroundColor: Color(0xFF0088CC),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return _buildContactItem(context, contacts[index]['name']!,
              contacts[index]['status']!, contacts[index]['lastActive']!);
        },
      ),
    );
  }

  // Fungsi untuk membangun item kontak dengan gambar profil acak online
  Widget _buildContactItem(
      BuildContext context, String name, String status, String lastActive) {
    // Menghasilkan URL gambar profil acak
    String profileImageUrl =
        "https://picsum.photos/200?random=${Random().nextInt(1000)}"; // Menambahkan parameter random untuk mendapatkan gambar berbeda

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage:
              NetworkImage(profileImageUrl), // Gambar profil acak dari API
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  lastActive == 'Online' ? Icons.circle : Icons.access_time,
                  color: lastActive == 'Online' ? Colors.green : Colors.grey,
                  size: 12,
                ),
                SizedBox(width: 6),
                Text(
                  lastActive,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF0088CC)),
        onTap: () {
          // Pindah ke halaman chat
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailScreen(name: name),
            ),
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final String name;

  const ChatDetailScreen({super.key, required this.name});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [
    {"text": "Hey, how are you?", "isSentByMe": "false"},
    {"text": "I'm good, thanks!", "isSentByMe": "true"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with ${widget.name}"),
        backgroundColor: Color(0xFF0088CC),
      ),
      body: Column(
        children: [
          // Tampilan pesan-pesan sebelumnya
          Expanded(
            child: ListView.builder(
              reverse: true, // Pesan terbaru muncul di bawah
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isSentByMe = messages[index]["isSentByMe"] == "true";
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color:
                            isSentByMe ? Color(0xFF0088CC) : Color(0xFFE1E1E1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        messages[index]["text"]!,
                        style: TextStyle(
                          color: isSentByMe ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input field untuk mengetik pesan
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Tombol mikrofon atau lampiran (opsional)
                IconButton(
                  icon: Icon(Icons.attach_file, color: Color(0xFF0088CC)),
                  onPressed: () {
                    // Fungsi untuk melampirkan file
                  },
                ),
                // Kotak input pesan
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                    maxLines: null, // Agar input bisa multiline
                  ),
                ),
                // Tombol kirim pesan
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFF0088CC)),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        // Menambahkan pesan yang dikirim ke list messages
                        messages.insert(0,
                            {"text": _controller.text, "isSentByMe": "true"});
                        // Membalas otomatis dengan balasan acak (untuk simulasi)
                        messages.insert(0, {
                          "text": "Got your message!",
                          "isSentByMe": "false"
                        });
                        _controller
                            .clear(); // Menghapus input setelah mengirim pesan
                      });
                    }
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
