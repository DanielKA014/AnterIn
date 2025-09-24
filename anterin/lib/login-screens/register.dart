import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Name"),
            ),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Register"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                "Already have account? Login here\nSudah punya akun? Login disini",
                style: TextStyle(color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
          ],
=======
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final passController = TextEditingController();
    final confirmController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/anterin-logo-vertical.png', width: 200, height: 200),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name / Nama Lengkap',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number / Nomor Telepon',
                ),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: passController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              TextField(
                controller: confirmController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password / Konfirmasi Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text('Register / Daftar'),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text(
                  "Already have account? Login here\nSudah punya akun? Login disini",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
>>>>>>> Stashed changes
        ),
      ),
    );
  }
}
