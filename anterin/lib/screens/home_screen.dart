// import 'package:anterin/routes/main_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(child: Text('Ini adalah Home Screen')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.push('/home/motorcycle/'),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.motorcycle_outlined),
                    SizedBox(width: 18),
                    Text('Nebeng Motor'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => context.push('/home/car/'),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.car_rental_outlined),
                    SizedBox(width: 18),
                    Text('Nebeng Mobil'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => context.push('/home/delivery/'),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.inventory_2_outlined),
                    SizedBox(width: 18),
                    Text('Titip Antar Barang'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
