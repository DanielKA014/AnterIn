import 'package:anterin/widgets/balance_info_widgets/balance_info_widget.dart';
import 'package:anterin/widgets/balance_info_widgets/financial_provider_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinancialProviderWidget extends StatelessWidget {
  const FinancialProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132.0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadiusGeometry.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 0.6,
              blurRadius: 0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(minWidth: 208.0),
                      child: BalanceInfoWidget(),
                    ),
                    FinancialProviderButtonWidget(
                      goRoute: () => context.push('/home/pay/'),
                      buttonCaption: 'Bayar',
                      iconName: Icons.arrow_upward_outlined,
                    ),
                    FinancialProviderButtonWidget(
                      goRoute: () => context.push('/home/top-up/'),
                      buttonCaption: 'Top Up',
                      iconName: Icons.add,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); //   WIDGET SALDO
  }
}
