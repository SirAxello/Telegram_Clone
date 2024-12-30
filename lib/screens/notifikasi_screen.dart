import 'package:flutter/material.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  // Status notifikasi masing-masing item
  bool _chatPribadi = true;
  bool _grup = true;
  bool _saluran = true;
  bool _suaraMedia = false;
  bool _suaraPanggilan = true;
  bool _silenceNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
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
              'Pengaturan Notifikasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Notifikasi untuk chat pribadi
            _buildNotificationItem(
              'Chat Pribadi',
              'Terima notifikasi dari chat pribadi.',
              Icons.chat,
              _chatPribadi,
              (value) {
                setState(() {
                  _chatPribadi = value;
                });
              },
            ),
            Divider(),

            // Notifikasi untuk grup
            _buildNotificationItem(
              'Grup',
              'Terima notifikasi dari grup yang Anda ikuti.',
              Icons.group,
              _grup,
              (value) {
                setState(() {
                  _grup = value;
                });
              },
            ),
            Divider(),

            // Notifikasi untuk saluran
            _buildNotificationItem(
              'Saluran',
              'Terima notifikasi dari saluran yang Anda ikuti.',
              Icons.broadcast_on_home,
              _saluran,
              (value) {
                setState(() {
                  _saluran = value;
                });
              },
            ),
            Divider(),

            // Notifikasi untuk suara media
            _buildNotificationItem(
              'Suara Media',
              'Terima notifikasi untuk media seperti video atau suara.',
              Icons.volume_up,
              _suaraMedia,
              (value) {
                setState(() {
                  _suaraMedia = value;
                });
              },
            ),
            Divider(),

            // Notifikasi untuk suara panggilan
            _buildNotificationItem(
              'Suara Panggilan',
              'Aktifkan suara panggilan saat ada panggilan masuk.',
              Icons.call,
              _suaraPanggilan,
              (value) {
                setState(() {
                  _suaraPanggilan = value;
                });
              },
            ),
            Divider(),

            // Mengatur pengaturan suara atau silence
            _buildNotificationItem(
              'Silence Notifications',
              'Nonaktifkan suara notifikasi untuk sementara.',
              Icons.notifications_off,
              _silenceNotifications,
              (value) {
                setState(() {
                  _silenceNotifications = value;
                });
              },
            ),
            Divider(),

            // Tombol untuk Reset Pengaturan
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reset pengaturan notifikasi ke default
                setState(() {
                  _chatPribadi = true;
                  _grup = true;
                  _saluran = true;
                  _suaraMedia = false;
                  _suaraPanggilan = true;
                  _silenceNotifications = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0088CC), // Warna tombol
                padding: EdgeInsets.symmetric(vertical: 14),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('Reset Pengaturan Notifikasi'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat tampilan item notifikasi
  Widget _buildNotificationItem(
    String title,
    String subtitle,
    IconData icon,
    bool isEnabled,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF0088CC)),
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
    );
  }
}
