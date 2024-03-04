import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/Common/apptext.dart';
import 'package:furmiture/Common/globalbutton.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreem extends StatefulWidget {
  const ProductScreem({super.key});

  @override
  State<ProductScreem> createState() => _ProductScreemState();
}

class _ProductScreemState extends State<ProductScreem> {
  int selectedindex = 01;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 455.h,
                      child: Image.asset("assets/images/product.png"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Globaltext(
                        text: Apptext.productname,
                        fontsize: 24,
                        fontweight: FontWeight.w400,
                        fontfamily: GoogleFonts.poppins().toString(),
                      ),
                      Row(
                        children: [
                          Globaltext(
                            text: Apptext.productprice,
                            fontsize: 32,
                            fontweight: FontWeight.w600,
                          ),
                          Spacer(),
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Appcolor.homescreencontainercolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Globaltext(
                            text: selectedindex.toString(),
                            fontfamily: GoogleFonts.inter().toString(),
                            fontsize: 18,
                            fontweight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Appcolor.homescreencontainercolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xffF2C94C),
                            size: 30,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Globaltext(
                            text: Apptext.rating,
                            fontweight: FontWeight.w600,
                            fontsize: 18,
                            fontfamily: GoogleFonts.poppins.toString(),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Globaltext(
                            text: Apptext.review,
                            fontweight: FontWeight.w400,
                            fontsize: 14,
                            fontfamily: GoogleFonts.poppins.toString(),
                            color: Appcolor.primarycolor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Globaltext(
                        text: Apptext.description,
                        fontweight: FontWeight.w400,
                        fontsize: 14,
                        fontfamily: GoogleFonts.poppins.toString(),
                        color: Appcolor.primarycolor,
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 56.h,
                            width: 56.w,
                            decoration: BoxDecoration(
                              color: Appcolor.homescreencontainercolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                Appimage.cart,
                                scale: 3,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          GlobalButton(
                            height: 56.h,
                            width: 263.w,
                            voidcallback: () {},
                            text: Apptext.productbuttontext,
                            fontweight: FontWeight.w400,
                            fontsize: 16,
                            fontfamily: GoogleFonts.poppins.toString(),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42.0),
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-1, -1),
                              blurRadius: 5,
                              color: Colors.grey.shade200),
                        ]),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56.h,
                ),
                Container(
                  height: 192.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-1, -1),
                          blurRadius: 5,
                          color: Colors.grey.shade200),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 34.h,
                        width: 34.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appcolor.primarycolor),
                        child: Center(
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 34.h,
                        width: 34.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appcolor.productroundbutton),
                        child: Center(
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Appcolor.productroundbutton2,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 34.h,
                        width: 34.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appcolor.productroundbutton),
                        child: Center(
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Appcolor.productroundbutton2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
