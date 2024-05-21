import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maya_x/Screen/product_screen.dart';
import 'package:maya_x/colors.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kAccentColor
                ),
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.done_rounded,
                  color: kPrimaryColor,
                  size: 128,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'আপনার অর্ডারটি কনফার্ম হয়েছে। ৩-৪ কার্যদিবসের মধ্যে আপনার অর্ডারটি পৌঁছে দেওয়া হবে।',
                style: TextStyle(
                  fontFamily: 'Kalpurush',
                  fontSize: 16,
                  color: kSecondaryColor
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 64,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kAccentColor,
                    borderRadius: BorderRadius.circular(16)
                ),
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> ProductScreen())
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'হোমে ফিরে যান',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Kalpurush',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: kPrimaryColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
