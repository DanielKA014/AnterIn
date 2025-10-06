import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopUpSuccessScreen extends StatelessWidget {
  const TopUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.goNamed('home');
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/success.png',
                    width: 256.0,
                    height: 256.0,
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    'Top up telah berhasil dilakukan!',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed('home');
                    },
                    child: const Text('Kembali ke Beranda'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
