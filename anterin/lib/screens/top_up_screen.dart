import 'package:anterin/widgets/top_up_widgets/top_up_method_button.dart';
import 'package:flutter/material.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                'Pilih Metode Top Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              TopUpMethodButton(title: 'ATM'),
              TopUpMethodButton(title: 'Internet / Mobile Banking'),
              TopUpMethodButton(title: 'Kartu Debit'),
              TopUpMethodButton(title: 'Kartu Kredit'),
              TopUpMethodButton(title: 'Mitra Kami'),
              TopUpMethodButton(title: 'Ind*maret'),
            ],
          ),
        ),
      ),
    );
  }
}
