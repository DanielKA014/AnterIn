import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromoSliderWidget extends StatelessWidget {
  const PromoSliderWidget({super.key});

  ClipRRect get img => _placeholderPicture();
  List<Widget>? get list => [img, img, img, img, img, img];

  ClipRRect _placeholderPicture() {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.all(Radius.circular(8.0)),
      child: Image.asset('assets/images/promo-image.jpg', fit: BoxFit.cover),
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
        items: list,
      ),
    );
  }
}
