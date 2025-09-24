import 'package:flutter/material.dart';
import 'new_pass.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: otpController,
              decoration: const InputDecoration(labelText: "Enter OTP"),
=======
    final otpController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/anterin-logo-vertical.png', width: 200, height: 200),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: const InputDecoration(
                labelText: 'Enter OTP / Masukkan OTP',
              ),
>>>>>>> Stashed changes
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
<<<<<<< Updated upstream
                  MaterialPageRoute(builder: (context) => const NewPassPage()),
                );
              },
              child: const Text("Verify"),
=======
                  MaterialPageRoute(builder: (_) => const NewPassPage()),
                );
              },
              child: const Text('Verify'),
>>>>>>> Stashed changes
            ),
          ],
        ),
      ),
    );
  }
}
<<<<<<< Updated upstream
  
=======
>>>>>>> Stashed changes
