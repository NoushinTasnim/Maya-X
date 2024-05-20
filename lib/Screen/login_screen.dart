import 'package:flutter/material.dart';
import 'package:maya_x/Screen/bottom_nav_screen.dart';
import 'package:maya_x/Screen/product_screen.dart';
import 'package:maya_x/Screen/sign_up_screen.dart';
import 'package:maya_x/colors.dart';

import '../components/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text(
                "লগ ইন",
                style: TextStyle(
                  fontFamily: "Kalpurush",
                  color: kSecondaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextInputFiledsWidget(phoneController: phoneController, passwordController: passwordController),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  vertical: 32,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'লগ ইন',
                  style: TextStyle(
                    fontFamily: 'Kalpurush',
                    color: kPrimaryColor,
                    fontSize: 16
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'অ্যাকাউন্ট নেই? ',
                  style: TextStyle(
                      fontFamily: 'Kalpurush',
                      color: kSecondaryColor,
                      fontSize: 16
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'সাইন আপ করুন',
                    style: TextStyle(
                        fontFamily: 'Kalpurush',
                        color: kAccentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}