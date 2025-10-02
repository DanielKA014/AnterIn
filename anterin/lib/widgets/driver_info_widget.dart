import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// Fungsi requestCallPermission tidak perlu di sini lagi,
// karena sudah ada di RideMapScreen

class DriverInfoWidget extends StatelessWidget {
  final String driverName;
  final String from;
  final String to;
  final VoidCallback onCall;
  final VoidCallback onChat;
  
  const DriverInfoWidget({
    super.key,
    required this.driverName,
    required this.from,
    required this.to,
    required this.onCall,
    required this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3, // Mengambil 1/3 bagian bawah layar
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Driver Profile and Actions
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/driver-motor-image.jpg"),
                  radius: 30,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    driverName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(onPressed: onCall, icon: const Icon(Icons.call, color: Colors.blueAccent)),
                IconButton(onPressed: onChat, icon: const Icon(Icons.chat, color: Colors.green)),
              ],
            ),
            const Divider(), // Garis pemisah
            // Lokasi From dan To
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.trip_origin, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Dari: $from",
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Tujuan: $to",
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}