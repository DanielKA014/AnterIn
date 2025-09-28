import 'package:flutter/material.dart';

class FinancialProviderButtonWidget extends StatelessWidget {
  final void Function() goRoute;
  final String buttonCaption;
  final IconData iconName;

  const FinancialProviderButtonWidget({
    super.key,
    required this.goRoute,
    required this.buttonCaption,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            onPressed: goRoute,
            child: Icon(iconName),
          ),
          Text(buttonCaption),
        ],
      ),
    );
  }
}
