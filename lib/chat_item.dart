import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String bulan;
  final String nama;   // Tambahkan ini
  final String pesan;  // Tambahkan ini

  const ChatItem({
    super.key, 
    required this.bulan, 
    required this.nama, 
    required this.pesan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.redAccent,
            backgroundImage: AssetImage('image/avatar.jpg'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama, // Gunakan variabel nama
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
                    const Icon(Icons.check, size: 16), 
                    Text(pesan) // Gunakan variabel pesan
                  ]),
                ],
              ),
            )),
          Text(bulan),
        ],
      ),
    );
  }
}