import 'package:flutter/material.dart';

class DriverInfoWidget extends StatelessWidget {
  final String driverName;
  final String from;
  final String to;
  final VoidCallback onCall;
  final VoidCallback onChat;
  final bool isDelivery;
  final String? weight;
  final String? itemType;

  const DriverInfoWidget({
    super.key,
    required this.driverName,
    required this.from,
    required this.to,
    required this.onCall,
    required this.onChat,
    this.isDelivery = false,
    this.weight,
    this.itemType,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/driver-motor-image.jpg",
              ),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                driverName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: onCall,
              icon: const Icon(Icons.call, color: Colors.blueAccent),
            ),
            IconButton(
              onPressed: onChat,
              icon: const Icon(Icons.chat, color: Colors.green),
            ),
          ],
        ),
        const Divider(),
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
        if (isDelivery) ...[
          const Divider(),
          Row(
            children: [
              const Icon(Icons.line_weight, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                "Berat Barang: $weight kg",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.category, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                "Jenis Barang: $itemType",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ],
    );

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: isDelivery ? SingleChildScrollView(child: content) : content,
      ),
    );
  }
}
