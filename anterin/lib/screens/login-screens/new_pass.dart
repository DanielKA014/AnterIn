import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPassPage extends StatelessWidget {
  const NewPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passController = TextEditingController();
    final confirmController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/anterin-logo-vertical.png',
              width: 200,
              height: 200,
            ),
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
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed('login');
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
