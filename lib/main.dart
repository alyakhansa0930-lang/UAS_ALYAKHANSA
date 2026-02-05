import 'package:flutter/material.dart';
import 'chat_item.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPage(),
  ));
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  final List<Map<String, String>> data = const [
    {"nama": "bayza azarine", "pesan": "okee", "bulan": "Januari"},
    {"nama": "raiksa ramanda", "pesan": "otw cantik", "bulan": "Februari"},
    {"nama": "bobianus", "pesan": "jangan lupa ya besok", "bulan": "Maret"},
    {"nama": "flora", "pesan": "Besok UAS nya apa aja?", "bulan": "April"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Chat"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          );
        },
        itemBuilder: (context, index) {
          final item = data[index]; 
          
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(
                    namaUser: item['nama']!,
                  ),
                ),
              );
            },
            child: ChatItem(
              bulan: item['bulan']!,
              nama: item['nama']!,
              pesan: item['pesan']!,
            ),
          );
        },
      ),
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final String namaUser;

  const ChatDetailPage({super.key, required this.namaUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          namaUser,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          "Hi $namaUser",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}