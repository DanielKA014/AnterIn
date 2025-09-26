import 'package:flutter/material.dart';

// stateless widget karena hanya memuat info statis,
// ubah ke statefull jika ingin membuat widget berfungsi
class BalanceInfoWidget extends StatelessWidget {
  const BalanceInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(9.0),
          child: Icon(Icons.account_balance_wallet_outlined),
        ),
        SizedBox(width: 16.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo Anda',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              'Rp888.888,88',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ],
    );
  }
}
