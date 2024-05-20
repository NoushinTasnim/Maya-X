import 'package:flutter/material.dart';

import '../colors.dart';
import 'my_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        title: const Text(
          'লাবিবা আক্তার',
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
