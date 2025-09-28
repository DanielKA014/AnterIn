import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopUpMethodButton extends StatelessWidget {
  final String title;
  const TopUpMethodButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.black),
          textStyle: WidgetStateProperty.all(TextStyle(fontSize: 20.0)),
        ),
        // hardcode langsung ke screen pembayaran saja
        onPressed: () => context.pushNamed('top-up-payment'),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(title),
              ),
              Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
