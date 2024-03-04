import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/Common/apptext.dart';
import 'package:furmiture/Common/globalbutton.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:furmiture/bottomnavigationbar.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Globaltext(
              text: Apptext.success,
              fontfamily: GoogleFonts.poppins().toString(),
              fontsize: 32,
              fontweight: FontWeight.w600,
            ),
            SizedBox(
              height: 27.h,
            ),
            Image.asset(
              Appimage.successimage,
              scale: 3,
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Globaltext(
                text: Apptext.successdiscription,
                fontfamily: GoogleFonts.poppins().toString(),
                fontsize: 16,
                fontweight: FontWeight.w400,
                color: Appcolor.primarycolor,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            GlobalButton(
              height: 56.h,
              width: double.infinity,
              voidcallback: () {},
              text: Apptext.successbtn1,
            ),
            SizedBox(
              height: 16.h,
            ),
            GlobalButton(
              height: 56.h,
              width: double.infinity,
              voidcallback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Bottomnavigationbarscreen(selectedindex: 0,)));
              },
              text: Apptext.successbtn2,
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
