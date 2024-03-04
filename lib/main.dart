import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Auth/signin.dart';
import 'package:furmiture/Auth/signup.dart';
import 'package:furmiture/View/HomeScreen/homescreen.dart';
import 'package:furmiture/Onbording/splashscreen.dart';
import 'package:furmiture/bottom_nev_bar.dart';
import 'package:furmiture/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token ;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  token = preferences.getString('token').toString();
  print("token ${token}");
  runApp(const MyApp());        
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: token != null ? Bottomnavigationbarscreen(selectedindex: 0,) : Signinscreen(),
      ),
    );
  }
}

