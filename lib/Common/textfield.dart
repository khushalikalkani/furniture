import 'package:flutter/material.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import 'globaltext.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final Icon? icon;
  final TextEditingController controller;
  final String message;

  const TextFieldWidget({
    super.key,
    required this.text,
    this.icon,
    required this.controller,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.010,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return message;
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            labelText: text,
            suffixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Appcolor.textfieldcolor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Appcolor.textfieldcolor,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Appcolor.textfieldcolor,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Appcolor.textfieldcolor,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

