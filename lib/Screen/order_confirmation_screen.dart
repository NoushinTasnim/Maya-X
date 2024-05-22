import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maya_x/Screen/bottom_nav_screen.dart';
import 'package:maya_x/Screen/product_screen.dart';
import 'package:maya_x/colors.dart';
import 'package:maya_x/utils/fetch_pixels.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(FetchPixels.getScale()*32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(FetchPixels.getScale()*100),
                  color: kAccentColor
                ),
                padding: EdgeInsets.all(FetchPixels.getScale()*16),
                child: Icon(
                  Icons.done_rounded,
                  color: kPrimaryColor,
                  size: FetchPixels.getScale()*128,
                ),
              ),
              SizedBox(
                height: FetchPixels.getPixelHeight(32),
              ),
              Text(
                'আপনার অর্ডারটি কনফার্ম হয়েছে। ৩-৪ কার্যদিবসের মধ্যে আপনার অর্ডারটি পৌঁছে দেওয়া হবে।',
                style: TextStyle(
                  fontFamily: 'Kalpurush',
                  fontSize: FetchPixels.getTextScale()*16,
                  color: kSecondaryColor
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: FetchPixels.getPixelHeight(64),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kAccentColor,
                    borderRadius: BorderRadius.circular(FetchPixels.getScale()*16)
                ),
                padding: EdgeInsets.all(FetchPixels.getScale()*16),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> BottomNavScreen())
                    );
                  },
                  child: Text(
                    'হোমে ফিরে যান',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: 'Kalpurush',
                      fontSize: FetchPixels.getTextScale()*16,
                      fontWeight: FontWeight.w700,
                    ),
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
