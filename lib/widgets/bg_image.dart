import 'package:flutter/material.dart';

class BgImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/images/bg_image.png",
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.2),
        colorBlendMode: BlendMode.darken,
      ),
    );

  }

}