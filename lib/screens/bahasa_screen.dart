import 'package:flutter/material.dart';

class BahasaScreen extends StatefulWidget {
  const BahasaScreen({super.key});

  @override
  _BahasaScreenState createState() => _BahasaScreenState();
}

class _BahasaScreenState extends State<BahasaScreen> {
  String selectedLanguage = 'English'; // Default language

  final List<String> languages = [
    'English',
    'Bahasa Indonesia',
    'Español',
    'Français',
    'Deutsch',
    'Русский',
    'Türkçe',
    'عربى',
    // Add more languages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bahasa',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              'Pilih Bahasa Anda',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // List of languages in a more attractive card layout
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return _buildLanguageCard(languages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan opsi bahasa dalam Card
  Widget _buildLanguageCard(String language) {
    bool isSelected = language == selectedLanguage;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        title: Text(
          language,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Color(0xFF0088CC) : Colors.black,
          ),
        ),
        trailing: isSelected
            ? Icon(
                Icons.check_circle,
                color: Color(0xFF0088CC),
              )
            : null,
        onTap: () {
          setState(() {
            selectedLanguage = language;
          });
        },
      ),
    );
  }
}
