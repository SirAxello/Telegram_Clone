import 'package:flutter/material.dart';
import 'package:appwrite/models.dart';
import '../services/auth_service.dart';

class AkunScreen extends StatefulWidget {
  @override
  _AkunScreenState createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  final AuthService _authService = AuthService();
  late Future<User?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture =
        _authService.getCurrentUser(); // Ambil data pengguna saat init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Color(0xFF0088CC),
      ),
      body: FutureBuilder<User?>(
        future: _userFuture, // Menggunakan FutureBuilder untuk mengambil data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Tampilkan loading saat data sedang diambil
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Tampilkan pesan error jika ada
          } else if (snapshot.hasData) {
            User? user = snapshot.data; // Ambil data pengguna
            if (user == null) {
              return Center(
                  child: Text(
                      'No user data available')); // Jika tidak ada data pengguna
            }
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileSection(user),
                  SizedBox(height: 20),
                  _buildAccountInfoSection(user),
                ],
              ),
            );
          } else {
            return Center(
                child: Text('No user data available')); // Jika tidak ada data
          }
        },
      ),
    );
  }

  // Membuat tampilan profil pengguna
  Widget _buildProfileSection(User user) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                user.avatarUrl ?? 'https://via.placeholder.com/150'),
          ),
          SizedBox(height: 10),
          Text(
            user.name, // Nama pengguna
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user.email, // Email pengguna
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  // Membuat informasi akun pengguna
  Widget _buildAccountInfoSection(User user) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Akun',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildAccountDetailRow('Username', user.name),
            _buildAccountDetailRow('Nomor Telepon', user.phone),
            _buildAccountDetailRow('Status', 'Aktif'),
          ],
        ),
      ),
    );
  }

  // Membuat baris untuk detail akun
  Widget _buildAccountDetailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

extension on User {
  get avatarUrl => null;
}
