import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Globaltext extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontsize;
  final dynamic fontweight;
  final dynamic fontfamily;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  Globaltext(
      {super.key,
      required this.text,
      this.color,
      this.fontsize,
      this.fontweight,
      this.fontfamily,
      this.textStyle,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle ??
          TextStyle(
            //overflow: TextOverflow.ellipsis,
            color: color ?? Colors.black,
            fontSize: fontsize ?? 14,
            fontWeight: fontweight ?? FontWeight.w500,
            fontFamily: fontfamily,
          ),
    );
  }
}
