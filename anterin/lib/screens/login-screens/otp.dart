import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpController = TextEditingController(); // Ubah nama controller
  bool _validate = false;
  bool _isPressed = false;

  final Random _random = Random();
  String _currentOtp =
      '131006'; // haha mas vincent otp tetap gw set default 131006
  // gw ambil ref dari https://www.geeksforgeeks.org/flutter/flutter-make-a-random-number-generator-app/
  // gw dah cek dan coba ga ngaruh mas vincent

  @override
  void initState() {
    super.initState();
    _otpController.clear();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _generateOtp() {
    setState(() {
      _currentOtp = (_random.nextInt(900000) + 100000).toString();
    });
    _showOtpAlert(context, _currentOtp);
  }

  void _checkText() {
    _isPressed = true;
    setState(() {
      _validate = _otpController.text.isNotEmpty;
    });

    if (_validate) {
      context.pushNamed('new-pass');
    }
  }

  void _showOtpAlert(BuildContext context, String otp) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kode OTP Anda'),
        content: Text('Kode OTP yang dikirim: $otp'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'Enter OTP / Masukkan OTP',
                errorText: _otpController.text.isEmpty && _isPressed
                    ? 'OTP tidak boleh kosong!'
                    : null,
                suffixIcon: TextButton(
                  onPressed: _generateOtp,
                  child: const Text(
                    'Kirim OTP',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (text) => setState(() {
                _isPressed = false;
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _checkText, child: const Text('Verify')),
          ],
        ),
      ),
    );
  }
}
