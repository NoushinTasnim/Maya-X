import 'package:flutter/material.dart';
import 'package:maya_x/model/User_model.dart';

import '../colors.dart';
import 'my_cart.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {

  Usermodel user= Usermodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kAccentColor,
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.menu_rounded,
          color: kPrimaryColor,
        ),
        title: Text(
          user.getName(),
          style: TextStyle(
            fontFamily: 'Kalpurush',
            color: kPrimaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => MyCartScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.shopping_cart_outlined,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
