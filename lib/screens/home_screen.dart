import 'package:flutter/material.dart';
import 'package:telegram/screens/auth_screen.dart';
import 'package:telegram/screens/chat_screen.dart'; // Import ChatScreen
import 'package:telegram/screens/contact_screen.dart'; // Import ContactScreen
import 'package:telegram/screens/setting_screen.dart'; // Import SettingScreen
import 'package:telegram/screens/new_message_screen.dart'; // Import halaman baru untuk menulis pesan
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Menyimpan index tab saat ini

  final List<Widget> _screens = [
    ChatScreen(), // Halaman untuk obrolan
    ContactScreen(), // Halaman untuk kontak
    SettingScreen(), // Halaman untuk pengaturan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Telegram Clone App",
            style: TextStyle(
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 28),
            onPressed: () {
              // Aksi pencarian
            },
          ),
        ],
        backgroundColor: Color(0xFF0088CC), // Warna biru khas Telegram
        elevation: 4,
      ),
      body: _screens[_currentIndex], // Menampilkan layar sesuai index saat ini
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Arahkan ke halaman menulis pesan baru dengan memilih kontak
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NewMessageScreen(), // Halaman menulis pesan baru
            ),
          );
        },
        backgroundColor: Color(0xFF0088CC), // Warna yang sama dengan AppBar
        mini: true,
        child: Icon(Icons.edit, size: 20), // Membuat tombol lebih kecil
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Color(0xFF0088CC)),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, color: Color(0xFF0088CC)),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color(0xFF0088CC)),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _currentIndex, // Menunjukkan tab yang aktif
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Ubah index tab saat ini sesuai yang dipilih
          });
        },
        selectedItemColor: Color(0xFF0088CC),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Logout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              child: Text('Batal', style: TextStyle(color: Color(0xFF0088CC))),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: Text('Logout', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('isLoggedIn'); // Hapus status login
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(), // Arahkan ke AuthScreen
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
