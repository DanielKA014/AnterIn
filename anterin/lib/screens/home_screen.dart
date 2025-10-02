import 'package:anterin/widgets/balance_info_widgets/financial_provider_widget.dart';
import 'package:anterin/widgets/promo_slider_widget.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(37, 0, 0, 0),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset('assets/images/banner.jpg'),
              ),
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
              Container(
                margin: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: const Text(
                    'Promo menarik hanya untuk Anda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              PromoSliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
