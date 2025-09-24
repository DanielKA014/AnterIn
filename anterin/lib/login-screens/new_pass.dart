import 'package:flutter/material.dart';
import 'login.dart';

class NewPassPage extends StatelessWidget {
  const NewPassPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Scaffold(
      appBar: AppBar(title: const Text("New Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "New Password"),
              obscureText: true,
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
=======
    final passController = TextEditingController();
    final confirmController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/anterin-logo-vertical.png', width: 200, height: 200),
            const SizedBox(height: 20),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password / Password Baru',
              ),
            ),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password / Konfirmasi Password',
              ),
>>>>>>> Stashed changes
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
<<<<<<< Updated upstream
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text("Confirm"),
=======
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text('Confirm'),
>>>>>>> Stashed changes
            ),
          ],
        ),
      ),
    );
  }
}
