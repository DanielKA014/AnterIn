import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RideInputScreenCar extends StatefulWidget {
  const RideInputScreenCar({super.key});

  @override
  State<RideInputScreenCar> createState() => _RideInputScreenCarState();
}

class _RideInputScreenCarState extends State<RideInputScreenCar> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push(
                  '/home/car/map',
                  extra: {
                    'from': fromController.text,
                    'to': toController.text,
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
