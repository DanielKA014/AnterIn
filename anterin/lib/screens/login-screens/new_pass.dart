import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPassPage extends StatefulWidget {
  const NewPassPage({super.key});

  @override
  State<NewPassPage> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _validate = false;
  bool _isPressed = false;

  void _checkText() {
    _isPressed = true;
    setState(() {
      _validate =
          (_passController.text.isNotEmpty &&
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
    _passController.clear();
    _confirmController.clear();
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

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
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password / Password Baru',
                errorText: _passController.text.isEmpty && _isPressed
                    ? 'Password baru tidak boleh kosong!'
                    : null,
              ),
              onChanged: (text) => setState(() {
                _isPressed = false;
              }),
            ),
            TextField(
              controller: _confirmController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password / Konfirmasi Password',
                errorText: _confirmController.text.isEmpty && _isPressed
                    ? 'Konfirmasi password tidak boleh kosong!'
                    : null,
              ),
              onChanged: (text) => setState(() {
                _isPressed = false;
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _checkText, child: const Text('Confirm')),
          ],
        ),
      ),
    );
  }
}
