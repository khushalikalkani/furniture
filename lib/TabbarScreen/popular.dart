import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/globaltext.dart';
import 'package:furmiture/models/show_product_model.dart';
import 'package:furmiture/View/HomeScreen/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Common/appcolor.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class furniturdetail {
  String image;
  String title;
  String price;

  furniturdetail(
      {required this.image, required this.title, required this.price});
}

List<furniturdetail> furnituredetaildata = [
  furniturdetail(
      image: "assets/images/Media.png",
      title: 'Black Simple Lamp',
      price: "\$ 12.00"),
  furniturdetail(
      image: "assets/images/Media.jpg",
      title: 'Minimal Stand',
      price: "\$ 25.00"),
  furniturdetail(
      image: "assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png",
      title: 'Coffee Chair',
      price: "\$ 12.00"),
  furniturdetail(
      image: "assets/images/Media (1).png",
      title: 'Simple Desk',
      price: "\$ 12.00"),
];

class _PopularState extends State<Popular> {
  Future<List<ProductModel>>? productdetail;
  String? Token;

  @override
  void initState() {
    super.initState();
    productdetail = GetProduct();
  }

  Future<List<ProductModel>> GetProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.getString('token', data['token']);
    Token = prefs.getString('token');
    log("tokallll ${Token.toString()}");
    final response = await http.get(
      Uri.parse(
          "https://typescript-al0m.onrender.com/api/user/product/showall-product"),
      headers: {'Authorization': "Bearer $Token"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('failed to load employees');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ProductModel>>(
          future: productdetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 256,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 21),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  ProductModel product = snapshot.data![index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return ProductScreem();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 200.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage(product.productImage.toString()),
                              //   fit: BoxFit.cover,
                              // ),
                              color: Colors.pink,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Globaltext(
                          text: product.productName.toString(),
                          color: Appcolor.primarycolor,
                        ),
                        Globaltext(
                          text: product.productPrice.toString(),
                          fontfamily: GoogleFonts.abhayaLibre().toString(),
                          fontweight: FontWeight.w600,
                          fontsize: 14,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            );
          }),
    );
  }
}
