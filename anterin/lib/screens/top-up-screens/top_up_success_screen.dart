import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopUpSuccessScreen extends StatelessWidget {
  const TopUpSuccessScreen({super.key});

  // Future<void> _onBackPressed(context, result) async {
  //   context.goNamed('home');
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        context.goNamed('home');
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Top up telah berhasil dilakukan!'),
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
    );
  }
}
