import 'package:flutter/material.dart';
import 'package:maya_x/Screen/login_screen.dart';
import 'package:maya_x/Screen/product_screen.dart';
import 'package:maya_x/colors.dart';

import '../components/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();

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
                "সাইন আপ",
                style: TextStyle(
                    fontFamily: "Kalpurush",
                    color: kSecondaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextInputFiledsWidget(phoneController: phoneController, passwordController: passwordController, userController: userController,),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(),
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
                  'সাইন আপ',
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
                  'অ্যাকাউন্ট আছে? ',
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
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'লগ ইন করুন',
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
