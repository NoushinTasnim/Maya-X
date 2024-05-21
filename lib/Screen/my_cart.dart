import 'package:flutter/material.dart';
import 'package:maya_x/Screen/bottom_nav_screen.dart';
import 'package:maya_x/Screen/checkout_screen.dart';
import 'package:maya_x/colors.dart';

import '../model/load_json.dart';
import '../model/order.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int _counter = 1;
  late Future<List<Order>> _futureOrders;

  @override
  void initState() {
    super.initState();
    _futureOrders = loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckOutScreen(),
            ),
          );
        },
        child: Icon(
          Icons.shopping_cart_checkout_rounded,
          color: kPrimaryColor,
        ),
      ),
      appBar: AppBar(
        leading: InkWell(
            onTap:(){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            )
        ),
        backgroundColor: kAccentColor,
        title: Text(
          'আমার কার্ট',
          style: TextStyle(
            fontFamily: 'Kalpurush',
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80), // Add padding to avoid content being hidden by the fixed button
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavScreen(),
                    ),
                  );
                },
                child: Text(
                  'আরও পণ্য যোগ করুন',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Kalpurush',
                    fontWeight: FontWeight.bold,
                    color: kAccentColor,
                  ),
                ),
              ),
            ),
            FutureBuilder<List<Order>>(
              future: _futureOrders,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No products available'));
                }

                final orders = snapshot.data!;
                return Column(
                  children: orders.map((order) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    order.image,
                                    height: 100,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          order.name,
                                          style: TextStyle(
                                            fontFamily: 'Kalpurush',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          order.amount,
                                          style: TextStyle(
                                            fontFamily: 'Kalpurush',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.add_circle,
                                        color: kAccentColor,
                                      ),
                                      Text("${order.quantity}"),
                                      Icon(
                                        Icons.remove_circle,
                                        color: kAccentColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
