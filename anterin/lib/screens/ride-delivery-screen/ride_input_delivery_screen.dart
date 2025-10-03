import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RideDeliveryScreen extends StatefulWidget {
  const RideDeliveryScreen({super.key});

  @override
  State<RideDeliveryScreen> createState() => _RideDeliveryScreenState();
}

class _RideDeliveryScreenState extends State<RideDeliveryScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController itemTypeController = TextEditingController();

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    weightController.dispose();
    itemTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: fromController,
              decoration: const InputDecoration(labelText: "Dari mana"),
            ),
            TextField(
              controller: toController,
              decoration: const InputDecoration(labelText: "Tujuan"),
            ),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: "Berat Barang (kg)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: itemTypeController,
              decoration: const InputDecoration(labelText: "Jenis Barang"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push(
                  '/home/delivery/map',
                  extra: {
                    'from': fromController.text,
                    'to': toController.text,
                    'weight': weightController.text,
                    'itemType': itemTypeController.text,
                  },
                );
              },
              child: const Text("Cari Driver"),
            ),
          ],
        ),
      ),
    );
  }
}