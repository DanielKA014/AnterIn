import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromoSliderWidget extends StatelessWidget {
  const PromoSliderWidget({super.key});

  // List nama file gambar
  List<String> get imageList => [
    'assets/images/promo/promo-image.jpg',
    'assets/images/promo/promo-image2.jpg',
    'assets/images/promo/promo-image3.jpg',
    'assets/images/promo/promo-image4.jpg',
    'assets/images/promo/promo-image5.jpg',
  ];

  ClipRRect _buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: 160.0,
        width: double.infinity,
        cacheWidth: 540,
      ),
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
        items: imageList.map((imagePath) => _buildImage(imagePath)).toList(),
      ),
    );
  }
}
