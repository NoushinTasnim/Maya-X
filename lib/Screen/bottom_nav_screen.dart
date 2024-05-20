import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:maya_x/Screen/login_screen.dart';
import 'package:maya_x/Screen/product_screen.dart';
import 'package:maya_x/Screen/sign_up_screen.dart';
import 'package:maya_x/colors.dart';

import 'home_screen.dart';
import 'learn_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    ProductScreen(),
    HomeScreen(),
    LearnScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kAccentColor,
          boxShadow: [
            BoxShadow(
              color: kAccentColor.withOpacity(0.8),
              blurRadius: 20,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.circular(48),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            tabs: [
              GButton(
                icon: Icons.shopping_cart,
                text: 'Buy Products',
              ),
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.book,
                text: 'Learn',
              ),
            ],
          ),
        ),
      ),
    );
  }
}