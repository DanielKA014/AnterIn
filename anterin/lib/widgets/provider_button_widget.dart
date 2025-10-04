import 'package:flutter/material.dart';

class ProviderButtonWidget extends StatelessWidget {
  final void Function() goRoute;
  final String buttonTitle;
  final IconData iconName;
  final EdgeInsets buttonMargin;

  const ProviderButtonWidget({
    super.key,
    required this.goRoute,
    required this.buttonTitle,
    required this.iconName,
    required this.buttonMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: goRoute,
        child: Row(
          children: <Widget>[
            Icon(iconName),
            const SizedBox(width: 18),
            Text(buttonTitle),
          ],
        ),
      ),
    );
  }
}
