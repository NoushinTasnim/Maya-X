import 'package:flutter/material.dart';
import 'package:maya_x/Screen/checkout_screen.dart';
import 'package:maya_x/Screen/my_cart.dart';
import 'package:maya_x/colors.dart';
import 'package:maya_x/model/user_model.dart';

import '../model/order.dart';
import '../model/product.dart';
import '../utils/store_json.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>MyCartScreen())
          );
        },
        backgroundColor: kAccentColor,
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: kPrimaryColor,
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap:(){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: kAccentColor,
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kSecondaryColor.withOpacity(0.5),
                      blurRadius: 48,
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(64),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(64),
                  ),
                  child: Image(
                    image: NetworkImage(product.image),
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontFamily: 'Kalpurush',
                        color: kAccentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                              const SnackBar(
                                backgroundColor: kSecondaryColor,
                                content: Text("পণ্যটি আপনার কার্টে যুক্ত হয়েছে",),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 5,
                                      offset: Offset(5,5)
                                  ),
                                  BoxShadow(
                                      color: Colors.white30,
                                      blurRadius: 15,
                                      offset: Offset(-5,-5)
                                  ),
                                ]
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: kAccentColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'কার্টে যোগ করুন',
                                  style: TextStyle(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () async {
                              Orders newOrder = Orders(
                                id: DateTime.now().toString(),
                                name: product.name,
                                vendor: product.vendor,
                                quantity: "১",
                                image: product.image,
                                date: DateTime.now(),
                                amount: product.amount, status: '',
                              );
                              String userId = Usermodel().getUserID();
                              await saveOrder(userId, newOrder);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: kSecondaryColor,
                                  content: Text("পণ্যটি আপনার কার্টে যুক্ত হয়েছে",),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                              decoration: BoxDecoration(
                                  color: kAccentColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 5,
                                        offset: Offset(5,5)
                                    ),
                                    BoxShadow(
                                        color: Colors.white30,
                                        blurRadius: 15,
                                        offset: Offset(-5,-5)
                                    ),
                                  ]
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'কার্টে যোগ করুন',
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'পণ্যের বিবরণী',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
                    child: Text(
                      product.details,
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}