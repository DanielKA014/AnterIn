import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromoSliderWidget extends StatelessWidget {
  const PromoSliderWidget({super.key});

  List<String> get list => [
    'assets/images/promo/promo-image1.jpg',
    'assets/images/promo/promo-image2.jpg',
    'assets/images/promo/promo-image3.jpg',
    'assets/images/promo/promo-image4.jpg',
    'assets/images/promo/promo-image5.jpg',
    'assets/images/promo/promo-image6.jpg',
  ];

  ClipRRect _placeholderPicture(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.all(Radius.circular(8.0)),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          viewportFraction: 0.75,
          enlargeFactor: 0.2,
          autoPlayInterval: const Duration(milliseconds: 2800),
        ),
        items: list.map((imagePath) => _placeholderPicture(imagePath)).toList(),
      ),
    );
  }
}
