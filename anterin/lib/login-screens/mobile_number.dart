import 'package:flutter/material.dart';
import 'otp.dart';

class MobileNumberPage extends StatelessWidget {
  const MobileNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Scaffold(
      appBar: AppBar(title: const Text("Mobile Number")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Mobile Number"),
=======
    final controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/anterin-logo-vertical.png', width: 200, height: 200),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter Mobile Number / Masukkan Nomor Ponsel',
              ),
>>>>>>> Stashed changes
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
<<<<<<< Updated upstream
                  MaterialPageRoute(builder: (context) => const OtpPage()),
                );
              },
              child: const Text("Send OTP"),
=======
                  MaterialPageRoute(builder: (_) => const OtpPage()),
                );
              },
              child: const Text('Send OTP'),
>>>>>>> Stashed changes
            ),
          ],
        ),
      ),
    );
  }
}
