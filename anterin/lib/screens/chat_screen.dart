import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildChatListItem(
            context,
            'Sean Malicious',
            'assets/images/driver-motor-image.jpg',
            'Terima kasih, hati-hati di jalan ya!',
            [
              {"sender": "driver", "text": "Baik, sama-sama. Hati-hati di jalan ya!"},
              {"sender": "user", "text": "Iya, terima kasih!"},
              {"sender": "driver", "text": "Sip, sampai tujuan dengan selamat!"}
            ],
          ),
          _buildChatListItem(
            context,
            'Sean Dangerous',
            'assets/images/driver-motor-image2.jpg',
            'Ada di depan gang ya, kak.',
            [
              {"sender": "driver", "text": "Kak, ada di depan gang ya."},
              {"sender": "user", "text": "Oke, saya sudah di sana."},
              {"sender": "driver", "text": "Siap, sudah lihat kak."},
            ],
          ),
          _buildChatListItem(
            context,
            'Sean Nutrious',
            'assets/images/driver-motor-image3.jpg',
            'Paket sudah saya terima.',
            [
              {"sender": "driver", "text": "Halo, paket sudah saya terima ya."},
              {"sender": "user", "text": "Baik, terima kasih!"},
              {"sender": "driver", "text": "Sama-sama. Saya akan segera menuju lokasi."},
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatListItem(
    BuildContext context,
    String driverName,
    String imagePath,
    String lastMessage,
    List<Map<String, String>> initialMessages,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(driverName),
      subtitle: Text(lastMessage, overflow: TextOverflow.ellipsis),
      onTap: () {
        context.push(
          '/chat-detail',
          extra: {
            'driverName': driverName,
            'initialMessages': initialMessages,
          },
        );
      },
    );
  }
}