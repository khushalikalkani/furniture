import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Common/appcolor.dart';
import 'Common/appimages.dart';
import 'Common/apptext.dart';
import 'Common/globalbutton.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
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
      image: "assets/images/Mask Group 3.png",
      title: 'Minimal Stand',
      price: "\$ 25.00"),
  cartdetail(
      image: "assets/images/Mask Group (1).png",
      title: 'Minimal Stand',
      price: "\$ 12.00"),
  cartdetail(
      image: "assets/images/Mask Group (2).png",
      title: 'Minimal Stand',
      price: "\$ 12.00"),
];

class _MyCartState extends State<MyCart> {
  int selecredindex = 1;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new,size: 20,),
        title: Globaltext(
          text: Apptext.mycart,
          fontweight: FontWeight.w600,
          fontsize: 16,
          fontfamily: GoogleFonts.poppins.toString(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              ),
                              Spacer(),
                              Row(
                                children: [
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
                                    width: 14.w,
                                  ),
                                  Globaltext(
                                    text: selecredindex.toString(),
                                    fontfamily: GoogleFonts.inter().toString(),
                                    fontsize: 18,
                                    fontweight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    width: 14.w,
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
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                Appimage.remove,
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
            Container(
              height: 44.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 20,
                        color: Colors.grey.shade200)
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 19),
                          border: InputBorder.none,
                          labelText: 'Enter your promo code',
                          labelStyle: TextStyle(color: Appcolor.primarycolor)),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Appcolor.blackcolor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Globaltext(
                  text: "Total: ",
                  fontweight: FontWeight.w700,
                  fontsize: 20,
                  fontfamily: GoogleFonts.inter().toString(),
                  color: Appcolor.primarycolor,
                ),
                Spacer(),
                Globaltext(
                  text: "\$ 95.00",
                  fontweight: FontWeight.w700,
                  fontsize: 20,
                  fontfamily: GoogleFonts.inter().toString(),
                  color: Appcolor.blackcolor,
                )
              ],
            ),

            Spacer(),
            GlobalButton(
              height: 56,
              width: double.infinity,
              voidcallback: () {},
              text: Apptext.mycartbutton,
              fontfamily: GoogleFonts.poppins().toString(),
              fontsize: 16,
              fontweight: FontWeight.w400,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
