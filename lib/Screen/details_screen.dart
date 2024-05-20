import 'package:flutter/material.dart';
import 'package:maya_x/Screen/checkout_screen.dart';
import 'package:maya_x/colors.dart';

import '../model/product.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap:(){
              Navigator.pop(context);
            },
            child: Icon(
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
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(64),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(64),
                  ),
                  child: Image.asset(
                    product.image,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontFamily: 'Kalpurush',
                              color: kAccentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          product.amount,
                          style: TextStyle(
                            color: kAccentColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: kSecondaryColor,
                                content: Text("পণ্যটি আপনার কার্টে যুক্ত হয়েছে",),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutScreen()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                                      blurRadius: 5,
                                      offset: Offset(-5,-5)
                                  ),
                                ]
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'অর্ডার করুন',
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
                    child: Text(
                      'Introducing the Fiddle Leaf Fig, a stunning indoor plant that adds a touch of elegance to any space. With its large, glossy leaves and tall stature, this plant is a true statement piece. The Fiddle Leaf Fig is known for its air-purifying qualities, making it not only beautiful but also beneficial for your indoor environment. Its lush green foliage brings a sense of freshness and serenity, creating a calming atmosphere. Whether placed in a living room, office, or bedroom, the Fiddle Leaf Fig is sure to be a conversation starter and a source of natural beauty.',
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

class Butttons extends StatelessWidget {
  const Butttons({
    super.key,
    required this.icons,
  });

  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.03),
        padding: EdgeInsets.all(10),
        height: 64,
        width: 64,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: kSecondaryColor.withOpacity(0.4),
                  blurRadius: 20,
                  offset: Offset(13,13)
              ),
              BoxShadow(
                  color: Colors.white.withOpacity(.6),
                  blurRadius: 15,
                  offset: Offset(-10,-8)
              )
            ]
        ),
        child: Icon(
          icons,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}