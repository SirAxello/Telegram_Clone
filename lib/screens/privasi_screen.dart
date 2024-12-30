import 'package:flutter/material.dart';

class PrivasiScreen extends StatefulWidget {
  const PrivasiScreen({super.key});

  @override
  _PrivasiScreenState createState() => _PrivasiScreenState();
}

class _PrivasiScreenState extends State<PrivasiScreen> {
  bool _whoCanSeePhoneNumber = true;
  bool _whoCanSeeProfilePicture = true;
  bool _whoCanSeeLastSeen = true;
  bool _whoCanSeeStatus = false;
  bool _whoCanMessage = true;
  bool _whoCanAddToGroup = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xFF0088CC),
        elevation: 4,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Header Section
            Text(
              'Pengaturan Privasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Pengaturan siapa yang bisa melihat nomor telepon
            _buildPrivacyOption(
              'Siapa yang bisa melihat nomor telepon saya?',
              'Atur siapa saja yang dapat melihat nomor telepon Anda.',
              _whoCanSeePhoneNumber,
              (value) {
                setState(() {
                  _whoCanSeePhoneNumber = value;
                });
              },
            ),
            Divider(),

            // Pengaturan siapa yang bisa melihat foto profil
            _buildPrivacyOption(
              'Siapa yang bisa melihat foto profil saya?',
              'Atur siapa saja yang dapat melihat foto profil Anda.',
              _whoCanSeeProfilePicture,
              (value) {
                setState(() {
                  _whoCanSeeProfilePicture = value;
                });
              },
            ),
            Divider(),

            // Pengaturan siapa yang bisa melihat status terakhir
            _buildPrivacyOption(
              'Siapa yang bisa melihat status terakhir saya?',
              'Atur siapa saja yang dapat melihat status terakhir Anda.',
              _whoCanSeeLastSeen,
              (value) {
                setState(() {
                  _whoCanSeeLastSeen = value;
                });
              },
            ),
            Divider(),

            // Pengaturan siapa yang bisa melihat status
            _buildPrivacyOption(
              'Siapa yang bisa melihat status saya?',
              'Atur siapa saja yang dapat melihat status terbaru Anda.',
              _whoCanSeeStatus,
              (value) {
                setState(() {
                  _whoCanSeeStatus = value;
                });
              },
            ),
            Divider(),

            // Pengaturan siapa yang bisa mengirim pesan
            _buildPrivacyOption(
              'Siapa yang bisa mengirim pesan kepada saya?',
              'Atur siapa yang dapat menghubungi Anda.',
              _whoCanMessage,
              (value) {
                setState(() {
                  _whoCanMessage = value;
                });
              },
            ),
            Divider(),

            // Pengaturan siapa yang bisa menambahkan ke grup
            _buildPrivacyOption(
              'Siapa yang bisa menambahkan saya ke grup?',
              'Atur siapa yang dapat menambahkan Anda ke grup.',
              _whoCanAddToGroup,
              (value) {
                setState(() {
                  _whoCanAddToGroup = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat tampilan pengaturan privasi
  Widget _buildPrivacyOption(
    String title,
    String subtitle,
    bool isEnabled,
    Function(bool) onChanged,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(Icons.lock, color: Color(0xFF0088CC)),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Switch(
          value: isEnabled,
          onChanged: onChanged,
          activeColor: Color(0xFF0088CC),
          activeTrackColor: Colors.lightBlueAccent,
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey[300],
        ),
      ),
    );
  }
}
