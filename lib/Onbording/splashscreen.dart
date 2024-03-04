import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Auth/signin.dart';
import 'package:furmiture/Auth/signup.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/Common/apptext.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Appimage.Splashimage,
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32, top: 96.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Globaltext(
                text: Apptext.splashtitle,
                fontsize: 32,
                color: Colors.black,
                fontweight: FontWeight.w600, textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 24.h,
              ),
              Globaltext(
                text: Apptext.splashsubtitle,
                fontsize: 16,
                color: Appcolor.primarycolor,
                fontweight: FontWeight.w400, textAlign: TextAlign.start,
              ),
              const Spacer(),
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Appcolor.globalbuttoncolor),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                      return Signinscreen();
                    }), (route) => false);
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.inter().toString(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
