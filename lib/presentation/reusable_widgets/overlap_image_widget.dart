

import 'package:flutter/material.dart';

import '../../themes/colors.dart';

Widget overlapImageWidget(double size) {
  return Row(
    spacing: 8,
    children: [
      Icon(Icons.star_border_rounded, color: grey),
      SizedBox(
        height: 30,
        width: 200,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 1.5, strokeAlign: BorderSide.strokeAlignCenter),
                ),
              ),
            ),
            Positioned(
              left: 15,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  border: Border.all(color: Colors.white, width: 1.5, strokeAlign: BorderSide.strokeAlignCenter),
                ),
              ),
            ),
            Positioned(
              left: 30,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                  border: Border.all(color: Colors.white, width: 1.5, strokeAlign: BorderSide.strokeAlignCenter),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
