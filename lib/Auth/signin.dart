import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/Common/apptext.dart';
import 'package:furmiture/Common/globalbutton.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:furmiture/Common/textfield.dart';
import 'package:furmiture/Onbording/splashscreen.dart';
import 'package:furmiture/bottomnavigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://typescript-al0m.onrender.com/api/user/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      log(response.statusCode.toString());
      var data = jsonDecode(response.body);
      log(data['message']);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(data['token']);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        final Token = prefs.getString('token');
        log('login!!');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Bottomnavigationbarscreen(selectedindex: 0,)),
            (route) => false);
      } else {
        log('Fail!');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 0.50,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    height: 64.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff303030)),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      Appimage.Signinimage,
                      scale: 3,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Container(
                      height: 0.50,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Globaltext(
                text: Apptext.signintitle,
                fontweight: FontWeight.w600,
                fontsize: 32,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 396.h,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: const Offset(1, 1),
                      blurRadius: 6,
                      color: Colors.grey.shade200),
                  BoxShadow(
                      offset: const Offset(-1, -1),
                      blurRadius: 6,
                      color: Colors.grey.shade200)
                ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    TextFieldWidget(
                      text: 'Email',
                      controller: emailController,
                      message: 'please enter a valid email',
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextFieldWidget(
                      text: 'password',
                      controller: passwordController,
                      message: 'please enter a valid email',
                      icon: const Icon(
                        Icons.visibility_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Globaltext(
                      text: Apptext.forgetpassword,
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                      fontfamily: GoogleFonts.inter.toString(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GlobalButton(
                      height: 56.h,
                      width: double.infinity,
                      voidcallback: () {
                        login(emailController.text, passwordController.text);
                      },
                      text: "Log in",
                      fontfamily: GoogleFonts.poppins.toString(),
                      fontweight: FontWeight.w400,
                      fontsize: 16,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Globaltext(
                      text: Apptext.signup,
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                      fontfamily: GoogleFonts.inter.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
