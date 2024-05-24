import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:maya_x/Screen/notification_screen.dart';
import 'package:maya_x/Screen/product_screen.dart';
import 'package:maya_x/colors.dart';
import 'package:maya_x/utils/fetch_pixels.dart';
import 'order_history.dart';

class BottomNavScreen extends StatefulWidget {

  const BottomNavScreen({super.key}) ;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    ProductScreen(),
    OrderHistoryScreen(),
    NotificationScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: PageTransitionSwitcher(
        transitionBuilder: (
            child,
            primaryAnimation,
            secondaryAnimation,
            ) => FadeThroughTransition(
          fillColor: kPrimaryColor,
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex],
      ),
      bottomNavigationBar:
      Container(
        margin: EdgeInsets.all(FetchPixels.getScale()*8),
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.circular(FetchPixels.getScale()*48),
        ),
        child: Padding(
          padding: EdgeInsets.all(FetchPixels.getScale()*8.0),
          child: GNav(
            selectedIndex: pageIndex,
            onTabChange: (value){
              print(value);
              setState(() {
                pageIndex = value;
              });
            },
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            backgroundColor: Colors.transparent,
            tabBackgroundColor: kPrimaryColor,
            color: Colors.white,
            activeColor: kAccentColor,
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: FetchPixels.getScale()*16, vertical: FetchPixels.getScale()*8),
            tabs: [
              GButton(
                icon: Icons.shopping_cart,
                text: 'হোম',
              ),
              GButton(
                icon: Icons.history,
                text: 'আমার অর্ডার',
              ),
              GButton(
                icon: Icons.notifications_outlined,
                text: 'নোটিফিকেশন',
              ),
            ],
          ),
        ),
      ),
    );
  }
}