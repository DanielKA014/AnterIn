import 'package:anterin/services/balance_service.dart';
import 'package:flutter/material.dart';

class BalanceInfoWidget extends StatefulWidget {
  const BalanceInfoWidget({super.key});

  @override
  State<BalanceInfoWidget> createState() => _BalanceInfoWidgetState();
}

class _BalanceInfoWidgetState extends State<BalanceInfoWidget> {
  BalanceService service = BalanceService();
  String formattedBalance = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
            ValueListenableBuilder(
              valueListenable: service.balanceNotifier,
              builder: (context, value, child) {
                formattedBalance = service.digitsFormater(value);
                return Text(
                  'Rp$formattedBalance',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
