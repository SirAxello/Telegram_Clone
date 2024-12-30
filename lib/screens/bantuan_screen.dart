import 'package:flutter/material.dart';

class BantuanScreen extends StatefulWidget {
  const BantuanScreen({super.key});

  @override
  _BantuanScreenState createState() => _BantuanScreenState();
}

class _BantuanScreenState extends State<BantuanScreen> {
  List<Question> faqList = [
    Question("Bagaimana cara mengatur profil saya?",
        "Untuk mengatur profil Anda, buka menu pengaturan, lalu pilih 'Akun' dan edit profil Anda."),
    Question("Bagaimana cara mengubah bahasa?",
        "Anda dapat mengubah bahasa dengan pergi ke pengaturan dan memilih 'Bahasa'."),
    Question("Apa itu Telegram Premium?",
        "Telegram Premium memberikan akses ke berbagai fitur tambahan, seperti lebih banyak stiker, batasan file yang lebih besar, dan lainnya."),
    Question("Bagaimana cara menghapus akun saya?",
        "Untuk menghapus akun Anda, pergi ke pengaturan, pilih 'Privasi', dan pilih 'Hapus Akun'."),
    Question("Bagaimana cara menghubungi support?",
        "Jika Anda membutuhkan bantuan, kunjungi pusat bantuan di 'Bantuan' pada menu pengaturan."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bantuan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xFF0088CC),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            return _buildFaqTile(faqList[index]);
          },
        ),
      ),
    );
  }

  // Membuat tampilan kolaps untuk FAQ dengan desain lebih menarik
  Widget _buildFaqTile(Question question) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Icon(
          Icons.help_outline,
          color: Color(0xFF0088CC),
        ),
        title: Text(
          question.question,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.answer,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Model untuk setiap pertanyaan dan jawabannya
class Question {
  final String question;
  final String answer;

  Question(this.question, this.answer);
}
