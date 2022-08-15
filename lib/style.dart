// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final String? text;
  final double? height;
  const PrimaryText(
      {Key? key,
       this.size,
       this.fontWeight,
       this.color,
       this.text,
       this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
