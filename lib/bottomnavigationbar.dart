import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furmiture/Common/appcolor.dart';
import 'package:furmiture/Common/appimages.dart';
import 'package:furmiture/View/CartScreen/cartscreen.dart';
import 'package:furmiture/View/HomeScreen/homescreen.dart';
import 'package:furmiture/View/NotificationScreen/notification.dart';
import 'package:furmiture/View/ProfileScreen/profile.dart';

class Bottomnavigationbarscreen extends StatefulWidget {
  int? selectedindex;
  Bottomnavigationbarscreen({super.key, this.selectedindex});



  @override
  State<Bottomnavigationbarscreen> createState() =>
      _BottomnavigationbarscreenState();
}

class _BottomnavigationbarscreenState extends State<Bottomnavigationbarscreen>with TickerProviderStateMixin {

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedindex = index;
    });
  }
  late TabController _tabController ;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }


  static List Screen = [
    HomeScreen(),
    CartScreen(),
    NotificationScreem(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Screen.elementAt( widget.selectedindex!),
      ),
      bottomNavigationBar: Container(
        height: 75.h,
        child: BottomNavigationBar(
          backgroundColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                Appimage.home,
                height: 24,
                color: widget.selectedindex! == 0 ? Colors.black : Appcolor.primarycolor,
              ),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Appimage.cart,
                height: 24,
                color: widget.selectedindex! == 1 ?  Colors.black : Appcolor.primarycolor,
              ),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Appimage.notification,
                height: 24,
                color: widget.selectedindex! == 2 ?  Colors.black : Appcolor.primarycolor ,
              ),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Appimage.profile,
                height: 24,
                color: widget.selectedindex! == 3 ? Colors.black : Appcolor.primarycolor,
              ),
              label: ""
            ),
          ],
          currentIndex: widget.selectedindex!,
          selectedItemColor: Colors.black,
          unselectedItemColor:Appcolor.primarycolor,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          selectedLabelStyle: TextStyle(fontSize: 0),
          unselectedLabelStyle: TextStyle(fontSize: 0),
        ),
      ),
    );
  }
}
