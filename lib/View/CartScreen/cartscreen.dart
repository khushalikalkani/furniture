import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/Common/apptext.dart';
import 'package:furmiture/Common/globalbutton.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:furmiture/View/HomeScreen/mycart.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class cartdetail {
  String image;
  String title;
  String price;

  cartdetail({required this.image, required this.title, required this.price});
}

List<cartdetail> cartdetaildata = [
  cartdetail(
      image: "assets/images/2681826 1.png",
      title: 'Minimal Stand',
      price: "\$ 12.00"),
  cartdetail(
      image: "assets/images/blackchair.png",
      title: 'Minimal Stand',
      price: "\$ 25.00"),
  cartdetail(
      image: "assets/images/whitechair.png",
      title: 'Minimal Stand',
      price: "\$ 12.00"),
  cartdetail(
      image: "assets/images/Media2.png",
      title: 'Minimal Stand',
      price: "\$ 12.00"),
];

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Globaltext(
            text: Apptext.favorite,
            fontweight: FontWeight.w600,
            fontsize: 16,
            fontfamily: GoogleFonts.poppins.toString(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartdetaildata.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image.asset(
                            cartdetaildata[index].image,
                            scale: 3,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Globaltext(
                                text: cartdetaildata[index].title,
                                color: Appcolor.primarycolor,
                                fontweight: FontWeight.w400,
                                fontsize: 16,
                              ),
                              Globaltext(
                                text: cartdetaildata[index].price,
                                color: Appcolor.blackcolor,
                                fontweight: FontWeight.bold,
                                fontsize: 16,
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                Appimage.remove,
                                scale: 3,
                              ),
                              Spacer(),
                              Image.asset(
                                Appimage.cartbeg,
                                scale: 3,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                );
              },
            ),
            Spacer(),
            GlobalButton(
              height: 56,
              width: double.infinity,
              voidcallback: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MyCart()));
              },
              text: Apptext.favoritebutton,
            fontfamily: GoogleFonts.poppins().toString(),
            fontsize: 16,
            fontweight: FontWeight.w400,),
          ],
        ),
      ),
    );
  }
}
