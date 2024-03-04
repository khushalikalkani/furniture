import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Auth/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Common/appimages.dart';
import '../Common/apptext.dart';
import '../Common/globalbutton.dart';
import '../Common/globaltext.dart';
import '../Common/textfield.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  Future<void> signup(String email, String password, String name) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://typescript-al0m.onrender.com/api/user/signUp'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': password,
        }),
      );

      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        log('Sign in!');
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (_) => const Signinscreen()),
        //     (route) => false);
      } else {
        log('fail!');
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
                    border: Border.all(color: Color(0xff303030)),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(Appimage.Signinimage),
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
              text: Apptext.signuptitle,
              fontweight: FontWeight.w600,
              fontsize: 32, textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 520.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 6,
                    color: Colors.grey.shade200),
                BoxShadow(
                    offset: Offset(-1, -1),
                    blurRadius: 6,
                    color: Colors.grey.shade200)
              ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFieldWidget(
                    text: 'Name',
                    controller: nameController,
                    message: 'please enter a valid email',
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFieldWidget(
                    text: 'Email',
                    controller: emailController,
                    message: 'please enter a valid email',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFieldWidget(
                    text: 'Password',
                    controller: passwordController,
                    message: 'please enter a valid email',
                    icon: Icon(
                      Icons.visibility_outlined,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFieldWidget(
                    text: 'confirm password',
                    controller: confirmController,
                    message: 'please enter a valid email',
                    icon: Icon(
                      Icons.visibility_outlined,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GlobalButton(
                    height: 56.h,
                    width: double.infinity,
                    voidcallback: () {
                      setState(() {
                        signup(emailController.text, passwordController.text,confirmController.text);
                      });

                    },
                    text: "Sign up",
                    fontfamily: GoogleFonts.poppins.toString(),
                    fontweight: FontWeight.w400,
                    fontsize: 16,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already have account?',
                      style: TextStyle(color: Color(0xff909090)),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                            fontFamily: GoogleFonts.inter.toString(),
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                          )
                        )
                      ]
                    ),

                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
