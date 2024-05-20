import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:maya_x/Screen/login_screen.dart';
import 'package:maya_x/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.amount,
  });

  final String image;
  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.white,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: kAccentColor,
          width: 1
        )
      ),
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, action) => Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                height: 150,
                image: AssetImage(image),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: kAccentColor.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Kalpursh',
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      openBuilder: (context, action) => LoginScreen(),
    );
  }
}