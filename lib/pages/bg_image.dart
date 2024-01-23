import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_image.png'), // Replace with your image asset path
          fit: BoxFit.cover, // You can adjust the fit as needed
        ),
      ),
    );
  }
}
