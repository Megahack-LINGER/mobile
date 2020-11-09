import 'package:flutter/material.dart';

Widget subPage(String pathImage, String text) {
  return Container(
      width: 1000,
      height: 1000,
      child: Column(
        children: [
          Image.network(
            pathImage,
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
          ),
          Text(text)
        ],
      ));
}
