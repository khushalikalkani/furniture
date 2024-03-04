import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furmiture/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController namecontroller = TextEditingController();

  Future<void> UpdateProfile(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? Token = preferences.getString('token');

    if (Token == null) {
      throw {
        Exception("token not found"),
      };
    }

    try {
      http.Response response = await http.put(Uri.parse(
          "https://typescript-al0m.onrender.com/api/user/update-profile"),
          headers: {
          'content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $Token',
          },
          body: jsonEncode({
            'name': name,
          })
      );

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        log("profile updated");
      } else {
        log('fail');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextFormField(
              controller: namecontroller,
            ),
          ),

          ElevatedButton(onPressed: (){
            UpdateProfile(namecontroller.text);
            Navigator.push(context, MaterialPageRoute(builder: (_) => Bottomnavigationbarscreen( selectedindex: 3,)));
          }, child: Text("Updated"))
        ],
      ),
    );
  }
}
