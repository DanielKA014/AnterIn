import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({super.key});

  @override
  State<MobileNumberPage> createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  final _numController = TextEditingController();
  bool _validate = false;
  bool _isPressed = false;

  void _checkText() {
    _isPressed = true;
    setState(() {
      _validate = _numController.text.isNotEmpty;
    });

    if (_validate) {
      context.pushNamed('otp');
    }
  }

  @override
  void initState() {
    super.initState();
    _numController.clear();
  }

  @override
  void dispose() {
    _numController.dispose();
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
              controller: _numController,
              decoration: InputDecoration(
                labelText: 'Enter Mobile Number / Masukkan Nomor Ponsel',
                errorText: _numController.text.isEmpty && _isPressed
                    ? 'Nomor Ponsel tidak boleh kosong!'
                    : null,
              ),
              keyboardType: TextInputType.phone,
              onChanged: (text) => setState(() {
                _isPressed = false;
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkText,
              child: const Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
