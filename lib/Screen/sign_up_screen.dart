import 'package:flutter/material.dart';
import 'package:maya_x/Screen/login_screen.dart';
import 'package:maya_x/Screen/otp_screen.dart';
import 'package:maya_x/colors.dart';
import '../components/text_input.dart';
import 'bottom_nav_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
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
                TextInputFiledsWidget(phoneController: phoneController, userController: userController,passwordController: passwordController),
                InkWell(
                  onTap: () async {

                    await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential){},
                        verificationFailed: (FirebaseAuthException ex){},
                        codeSent:(String Verificationid,int? resendtoken){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPScreen(verificationId: Verificationid),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String Verificationid){},
                        phoneNumber:phoneController.text.toString() );



                    CollectionReference collref =FirebaseFirestore.instance.collection('user');
                    collref.add({
                      'phone':phoneController.text.trim(),
                      'password':passwordController.text.trim(),
                      'name':userController.text.trim(),

                    });

                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                    decoration: BoxDecoration(
                      color: kAccentColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
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
                    const Text(
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
                      child: const Text(
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
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
