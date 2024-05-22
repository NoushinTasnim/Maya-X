import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maya_x/Screen/details_screen.dart';
import 'package:maya_x/colors.dart';
import '../model/order.dart';
import '../model/product.dart';
import '../model/user_model.dart';
import '../utils/store_json.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
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
                  image: NetworkImage(product.image),
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
                    color: kSecondaryColor.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontFamily: 'Kalpursh',
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.amount,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Orders newOrder = Orders(
                              id: DateTime.now().toString(),
                              name: product.name,
                              vendor: product.vendor,
                              quantity: "১",
                              image: product.image,
                              date: DateTime.now(),
                              amount: product.amount,
                              status: "pending"
                            );
                            String userId = Usermodel().getUserID();
                            await saveOrder(userId, newOrder);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: kSecondaryColor,
                                content: Text("পণ্যটি আপনার কার্টে যুক্ত হয়েছে",),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: kAccentColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        openBuilder: (context, action) => DetailsScreen(product: product),
      ),
    );
  }
}