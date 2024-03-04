import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/Common/apptext.dart';
import 'package:furmiture/Common/globalbutton.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:furmiture/View/HomeScreen/mycart.dart';
import 'package:furmiture/View/HomeScreen/success.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const MyCart()));
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          Apptext.checkout,
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().toString(),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Globaltext(
                  text: Apptext.shippingaddress,
                  color: Appcolor.primarycolor,
                ),
                Spacer(),
                Image.asset(
                  Appimage.edit,
                  scale: 3,
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              height: 119.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 20,
                        color: Colors.grey.shade300),
                    BoxShadow(
                        offset: Offset(-1, -1),
                        blurRadius: 20,
                        color: Colors.grey.shade300),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(6.sp))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Globaltext(
                    text: Apptext.shippingname,
                    fontfamily: GoogleFonts.poppins().toString(),
                    fontsize: 18,
                    fontweight: FontWeight.w600,
                  ),
                  Divider(),
                  Globaltext(
                    text: Apptext.address,
                    fontweight: FontWeight.w400,
                    fontsize: 14,
                    fontfamily: GoogleFonts.poppins().toString(),
                    color: Appcolor.primarycolor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Globaltext(
                  text: Apptext.payment,
                  color: Appcolor.primarycolor,
                  fontfamily: GoogleFonts.inter().toString(),
                  fontsize: 18,
                  fontweight: FontWeight.w400,
                ),
                Spacer(),
                Image.asset(
                  Appimage.edit,
                  scale: 3,
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              height: 68.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 20,
                      color: Colors.grey.shade300),
                  BoxShadow(
                      offset: Offset(-1, -1),
                      blurRadius: 20,
                      color: Colors.grey.shade300),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(6.sp),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(Appimage.paymentcard),
                  SizedBox(
                    width: 16.w,
                  ),
                  Globaltext(
                    text: "**** **** **** 3947",
                    fontweight: FontWeight.w600,
                    fontsize: 14,
                    fontfamily: GoogleFonts.poppins().toString(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Globaltext(
                  text: Apptext.shippingaddress,
                  color: Appcolor.primarycolor,
                  fontfamily: GoogleFonts.inter().toString(),
                  fontsize: 18,
                  fontweight: FontWeight.w400,
                ),
                Spacer(),
                Image.asset(
                  Appimage.edit,
                  scale: 3,
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              height: 54.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 20,
                        color: Colors.grey.shade300),
                    BoxShadow(
                        offset: Offset(-1, -1),
                        blurRadius: 20,
                        color: Colors.grey.shade300),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(6.sp))),
              child: Row(
                children: [
                  Image.asset(
                    Appimage.logo,
                    scale: 3,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Globaltext(
                    text: "Fast (2-3days)",
                    fontweight: FontWeight.w600,
                    fontsize: 14,
                    fontfamily: GoogleFonts.poppins().toString(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                height: 134.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 20,
                          color: Colors.grey.shade300),
                      BoxShadow(
                          offset: Offset(-1, -1),
                          blurRadius: 20,
                          color: Colors.grey.shade300),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(6.sp))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Globaltext(
                          text: Apptext.Order,
                          fontweight: FontWeight.w400,
                          fontsize: 18,
                          fontfamily: GoogleFonts.poppins().toString(),
                          color: Appcolor.primarycolor,
                        ),
                        Spacer(),
                        Globaltext(text: Apptext.Orderprice)
                      ],
                    ),
                    Row(
                      children: [
                        Globaltext(
                          text: Apptext.Delivery,
                          fontweight: FontWeight.w400,
                          fontsize: 18,
                          fontfamily: GoogleFonts.poppins().toString(),
                          color: Appcolor.primarycolor,
                        ),
                        Spacer(),
                        Globaltext(text: Apptext.Deliveryprice)
                      ],
                    ),
                    Row(
                      children: [
                        Globaltext(
                          text: Apptext.Total,
                          fontweight: FontWeight.w400,
                          fontsize: 18,
                          fontfamily: GoogleFonts.poppins().toString(),
                          color: Appcolor.primarycolor,
                        ),
                        Spacer(),
                        Globaltext(text: Apptext.Totalprice)
                      ],
                    ),
                  ],
                )),
            Spacer(),
            GlobalButton(
                height: 56.h,
                width: double.infinity,
                voidcallback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SuccessScreen()));
                },
                text: Apptext.submitorder),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
