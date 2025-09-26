// import 'package:anterin/routes/main_router.dart';
import 'package:anterin/widgets/financial_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/provider_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FinancialProviderWidget(), //   WIDGET SALDO
              ProviderButtonWidget(
                goRoute: () => context.push('/home/motorcycle/'),
                buttonTitle: 'Nebeng Motor',
                iconName: Icons.motorcycle_outlined,
              ),
              ProviderButtonWidget(
                goRoute: () => context.push('/home/car/'),
                buttonTitle: 'Nebeng Mobil',
                iconName: Icons.car_rental_outlined,
              ),
              ProviderButtonWidget(
                goRoute: () => context.push('/home/delivery/'),
                buttonTitle: 'Titip Antar Barang',
                iconName: Icons.inventory_2_outlined,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
