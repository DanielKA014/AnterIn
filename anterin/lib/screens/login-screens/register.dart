import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _validate = false;
  bool _isPressed = false;

  void _checkText() {
    _isPressed = true;
    setState(() {
      _validate =
          (_nameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _passController.text.isNotEmpty &&
          _confirmController.text.isNotEmpty &&
          _passController.text == _confirmController.text);
    });

    if (_validate) {
      context.goNamed('login');
    } else if (_passController.text != _confirmController.text &&
        _passController.text.isNotEmpty &&
        _confirmController.text.isNotEmpty) {
      // Tampilkan pesan error jika password tidak cocok
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password dan Konfirmasi Password tidak cocok!'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.clear();
    _phoneController.clear();
    _passController.clear();
    _confirmController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name / Nama Lengkap',
                  errorText: _nameController.text.isEmpty && _isPressed
                      ? 'Nama Lengkap tidak boleh kosong!'
                      : null,
                ),
                onChanged: (text) => setState(() {
                  _isPressed = false;
                }),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number / Nomor Telepon',
                  errorText: _phoneController.text.isEmpty && _isPressed
                      ? 'Nomor Telepon tidak boleh kosong!'
                      : null,
                ),
                keyboardType: TextInputType.phone,
                onChanged: (text) => setState(() {
                  _isPressed = false;
                }),
              ),
              TextField(
                controller: _passController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passController.text.isEmpty && _isPressed
                      ? 'Password tidak boleh kosong!'
                      : null,
                ),
                obscureText: true,
                onChanged: (text) => setState(() {
                  _isPressed = false;
                }),
              ),
              TextField(
                controller: _confirmController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password / Konfirmasi Password',
                  errorText: _confirmController.text.isEmpty && _isPressed
                      ? 'Konfirmasi Password tidak boleh kosong!'
                      : null,
                ),
                obscureText: true,
                onChanged: (text) => setState(() {
                  _isPressed = false;
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkText,
                child: const Text('Register / Daftar'),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.goNamed('login');
                },
                child: const Text(
                  "Already have account? Login here\nSudah punya akun? Login disini",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
