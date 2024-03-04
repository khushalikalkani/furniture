import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/Common/apptext.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:furmiture/TabbarScreen/armchair.dart';
import 'package:furmiture/TabbarScreen/bed.dart';
import 'package:furmiture/TabbarScreen/chair.dart';
import 'package:furmiture/TabbarScreen/popular.dart';
import 'package:furmiture/models/show_product_model.dart';
import 'package:furmiture/View/HomeScreen/mycart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  int selectedindex = 0;
  late TabController _tabController;
  void _onitemtapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Appimage.searchimage,
          scale: 3,
        ),
        title: Align(
          alignment: Alignment.center,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: Apptext.hometitle,
                style: TextStyle(
                  color: Appcolor.primarycolor,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().toString(),
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: Apptext.hometitle1,
                    style: TextStyle(
                      color: Appcolor.primarycolor,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.inter().toString(),
                      fontSize: 18,
                    ),
                  )
                ]),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_){return MyCart();}),);
              },
              child: Image.asset(
                Appimage.cartimage,
                scale: 3,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: 36.h,
            ),
            Container(
              height: 80,
              child: TabBar(
                labelPadding: const EdgeInsets.only(bottom: 10),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
                controller: _tabController,
                labelColor: Appcolor.primarycolor,
                unselectedLabelColor: Appcolor.blackcolor,
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().toString(),
                ),
                tabs: [
                  Column(
                    children: [
                      Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: selectedindex == 0
                              ? Appcolor.blackcolor
                              : Appcolor.homescreencontainercolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          Appimage.popular,
                          scale: 3,
                          color: selectedindex == 0
                              ? Colors.white
                              : Appcolor.primarycolor,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        Apptext.popular,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: selectedindex == 0
                                ? Appcolor.blackcolor
                                : Appcolor.primarycolor),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: selectedindex == 1
                              ? Appcolor.blackcolor
                              : Appcolor.homescreencontainercolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          Appimage.chair,
                          scale: 3,
                          color: selectedindex == 1
                              ? Colors.white
                              : Appcolor.primarycolor,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        Apptext.chair,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: selectedindex == 1
                                ? Appcolor.blackcolor
                                : Appcolor.primarycolor),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: selectedindex == 2
                              ? Appcolor.blackcolor
                              : Appcolor.homescreencontainercolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          Appimage.table,
                          scale: 3,
                          color: selectedindex == 2
                              ? Colors.white
                              : Appcolor.primarycolor,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        Apptext.table,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: selectedindex == 2
                                ? Appcolor.blackcolor
                                : Appcolor.primarycolor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: selectedindex == 3
                              ? Appcolor.blackcolor
                              : Appcolor.homescreencontainercolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          Appimage.armchair,
                          scale: 3,
                          color: selectedindex == 3
                              ? Colors.white
                              : Appcolor.primarycolor,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        Apptext.armchair,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: selectedindex == 3
                                ? Appcolor.blackcolor
                                : Appcolor.primarycolor),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: selectedindex == 4
                              ? Appcolor.blackcolor
                              : Appcolor.homescreencontainercolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          Appimage.bed,
                          scale: 3,
                          color: selectedindex == 4
                              ? Colors.white
                              : Appcolor.primarycolor,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        Apptext.bed,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: selectedindex == 4
                                ? Appcolor.blackcolor
                                : Appcolor.primarycolor),
                      ),
                    ],
                  ),
                ],
                onTap: _onitemtapped,
                mouseCursor: MouseCursor.uncontrolled,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Popular(),
                Chair(),
                Table(),
                Armchair(),
                Bed(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
