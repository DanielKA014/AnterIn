import 'package:anterin/widgets/top_up_widgets/top_up_input.dart';
import 'package:flutter/material.dart';

class TopUpPaymentScreen extends StatelessWidget {
  const TopUpPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Masukkan Nominal Top Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                TopUpTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
