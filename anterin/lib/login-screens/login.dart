import 'package:flutter/material.dart';
import 'mobile_number.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // belum ada tujuan, biarkan kosong
              },
              child: const Text("Login"),
=======
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/anterin-logo-vertical.png', width: 200, height: 200),
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
>>>>>>> Stashed changes
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
<<<<<<< Updated upstream
                  MaterialPageRoute(builder: (context) => const MobileNumberPage()),
                );
              },
              child: const Text(
                "Forgot password? / Lupa kata sandi",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
=======
                  MaterialPageRoute(builder: (_) => const MobileNumberPage()),
                );
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
                // sementara belum ada fungsi login
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
>>>>>>> Stashed changes
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
<<<<<<< Updated upstream
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
=======
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
>>>>>>> Stashed changes
                );
              },
              child: const Text(
                "Don’t have account? Register here\nTidak punya akun? Daftar disini",
<<<<<<< Updated upstream
                style: TextStyle(color: Colors.blue),
                textAlign: TextAlign.center,
=======
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
>>>>>>> Stashed changes
              ),
            ),
          ],
        ),
      ),
    );
  }
}
