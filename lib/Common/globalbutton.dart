import 'package:flutter/material.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import 'globaltext.dart';

class GlobalButton extends StatelessWidget {
  final double height;
  final double width;
  final Function() voidcallback;
  final String text;
  final Color? color;
  final double? fontsize;
  final dynamic fontweight;
  final dynamic fontfamily;

  const GlobalButton({
    super.key,
    required this.height,
    required this.width,
    required this.voidcallback,
    required this.text,
    this.color,
    this.fontsize,
    this.fontweight,
    this.fontfamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Appcolor.globalbuttoncolor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: voidcallback,
        child: Center(
          child: Globaltext(
            text: text,
            fontfamily: fontfamily ,
            fontweight: fontweight ?? FontWeight.w600,
            color: color ?? Colors.white,
            fontsize: fontsize,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
