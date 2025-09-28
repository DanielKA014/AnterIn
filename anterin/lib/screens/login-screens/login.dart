import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: const InputDecoration(
                labelText: 'Your Number / Nomor Hp Anda',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password / Kata Sandi',
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   // MaterialPageRoute(builder: (_) => const MobileNumberPage()),
                //   '/login/mobile-number/',
                // );
                context.pushNamed('mobile-number');
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password? / Lupa kata sandi?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // langsung ke home aja, belum ada backend proper
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(builder: (_) => const HomeScreen()),
                //   ModalRoute.withName('/'),
                // );
                context.goNamed('home');
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   // MaterialPageRoute(builder: (_) => const RegisterPage()),
                //   '/register',
                // );
                context.pushNamed('register');
              },
              child: const Text(
                "Don't have account? Register here\nTidak punya akun? Daftar disini",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
