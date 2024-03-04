import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Auth/signin.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:furmiture/View/ProfileScreen/update.dart';
import 'package:furmiture/models/getprofile_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class profileScreen {
  String title;
  String subtitle;

  profileScreen({required this.title, required this.subtitle});
}

List<profileScreen> Profiledetail = [
  profileScreen(title: 'My orders', subtitle: 'Already have 10 orders'),
  profileScreen(title: 'Shipping Addresses', subtitle: '03 Addresses'),
  profileScreen(title: 'Payment Method', subtitle: 'You have 2 cards'),
  profileScreen(title: 'My reviews', subtitle: 'Reviews for 5 items'),
  profileScreen(
      title: 'Setting', subtitle: 'Notification, Password, FAQ, Contact'),
];
List<String> title = [
  "My orders",
  "Shipping Addresses",
  "Payment Method",
  "My reviews",
  "Setting",
];

List<String> subtitle = [
  "Already have 10 orders",
  "03 Addresses",
  "You have 2 cards",
  "Reviews for 5 items",
  "Notification, Password, FAQ, Contact",
];

class _ProfileScreenState extends State<ProfileScreen> {
  // void showAlertDialog(BuildContext context) {
  //
  //    // set up the button
  //    Widget okButton = TextButton(
  //      child: Text("yes"),
  //      onPressed: () {
  //
  //      },
  //    );
  //    Widget noButton = TextButton(
  //      child: Text("no"),
  //      onPressed: () {
  //        Navigator.pop(context);
  //      },
  //    );
  //
  //    // set up the AlertDialog
  //    AlertDialog alert = AlertDialog(
  //      title: Text("Delete"),
  //      content: Text("do you want to delete?"),
  //      actions: [
  //        okButton,
  //        noButton
  //      ],
  //    );
  //
  //    // show the dialog
  //    showDialog(
  //      context: context,
  //      builder: (BuildContext context) {
  //        return alert;
  //      },
  //    );
  //  }

  Future<GetProfile>? profiledetail;
  String? Token;

  @override
  void initState() {
    profiledetail = GetProduct();
    super.initState();
  }

  Future<GetProfile> GetProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.getString('token', data['token']);
    Token = prefs.getString('token');
    log(Token.toString());
    final response = await http.get(
      Uri.parse("https://typescript-al0m.onrender.com/api/user/get-profile"),
      headers: {'Authorization': "Bearer $Token"},
    );
    if (response.statusCode == 200) {
      return GetProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load employees');
    }
  }

  Future DeleteProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.getString('token', data['token']);
    Token = prefs.getString('token');
    log(Token.toString());
    final response = await http.delete(
      Uri.parse("https://typescript-al0m.onrender.com/api/user/delete-profile"),
      headers: {
        'content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $Token"
      },
    );
    if (response.statusCode == 200) {
      log(response.body);
      log("delete successfully");
      prefs.remove("token");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Signinscreen()), (route) => false);


    } else {
      throw Exception('failed to load employees');
    }
  }

  void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("yes"),
      onPressed: () {
        DeleteProduct();
      },
    );
    Widget noButton = TextButton(
      child: Text("no"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("do you want to delete?"),
      actions: [okButton, noButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                height: 44.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text("delete")),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().toString(),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return UpdateScreen();
                          }));
                        },
                        child: Text("Update"))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder<GetProfile>(
                  future: profiledetail,
                  builder: (context, snapshot) {
                    return Container(
                      height: 80.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/avatar.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Globaltext(
                                text: snapshot.data?.name.toString() ?? " ",
                                fontsize: 20,
                                fontfamily: GoogleFonts.inter().toString(),
                                fontweight: FontWeight.w700,
                              ),
                              Globaltext(
                                text: snapshot.data?.email.toString() ?? " ",
                                fontsize: 14,
                                fontfamily: GoogleFonts.inter().toString(),
                                fontweight: FontWeight.w400,
                                color: Appcolor.primarycolor,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 30.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(1, 1),
                                blurRadius: 20,
                                color: Colors.grey.shade300),
                            BoxShadow(
                                offset: const Offset(-1, -1),
                                blurRadius: 20,
                                color: Colors.grey.shade300),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Globaltext(
                                    text: title[index],
                                    fontweight: FontWeight.w600,
                                    fontsize: 18.h,
                                    fontfamily:
                                        GoogleFonts.poppins().toString(),
                                  ),
                                  Globaltext(
                                    text: subtitle[index],
                                    fontweight: FontWeight.w400,
                                    fontsize: 12,
                                    fontfamily:
                                        GoogleFonts.poppins().toString(),
                                    color: Appcolor.primarycolor,
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
