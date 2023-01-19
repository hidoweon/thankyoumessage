import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;

  BigText({Key? key,
    this.color = Colors.black,
    required this.text,
    this.size=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0? Dimensions.font20 : size,
        fontWeight: FontWeight.w900,

      ),
    );
  }
}
