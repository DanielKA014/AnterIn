import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _numController = TextEditingController();
  final _passController = TextEditingController();
  bool _validate = false;
  bool _isPressed = false;

  void _checkText() {
    _isPressed = true;
    setState(() {
      _validate =
          (_numController.text.isNotEmpty && _passController.text.isNotEmpty);
    });

    if (_validate) {
      context.goNamed('home');
    }
  }

  @override
  void initState() {
    super.initState();
    _passController.clear();
    _numController.clear();
  }

  @override
  void dispose() {
    _passController.dispose();
    _numController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
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
                  controller: _numController,
                  decoration: InputDecoration(
                    labelText: 'Your Number / Nomor Hp Anda',
                    errorText: _numController.text.isEmpty && _isPressed
                        ? 'Nomor tidak boleh kosong!'
                        : null,
                  ),
                  onChanged: (text) => setState(() {
                    _isPressed = false;
                  }),
                ),
                TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                    labelText: 'Password / Kata Sandi',
                    errorText: _passController.text.isEmpty && _isPressed
                        ? 'Kata sandi tidak boleh kosong!'
                        : null,
                  ),
                  onChanged: (text) => setState(() {
                    _isPressed = false;
                  }),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
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
                  onPressed: _checkText,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
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
        ),
      ),
    );
  }
}
