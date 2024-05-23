import 'package:maya_x/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:maya_x/Screen/bottom_nav_screen.dart';
import 'package:maya_x/colors.dart';
import 'package:maya_x/model/user_model.dart';
import 'package:maya_x/utils/fetch_pixels.dart';
import 'package:maya_x/utils/map_numbers.dart';
import 'package:maya_x/utils/store_json.dart';
import '../components/appbar.dart';
import '../utils/load_json.dart';
import '../model/order.dart';
import 'checkout_screen.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late Future<List<Orders>> _futureOrders;
  List<Orders> _orders = [];
  Usermodel user= Usermodel();

  @override
  void initState() {
    super.initState();
    print(user.getUserID());
    _futureOrders = loadOrders(user.getUserID()).then((orders) {
      setState(() {
        _orders = orders;
      });
      return orders;
    });
  }

  Future<void> _updateQuantity(Orders order, int increment) async {
    String qnt = banglaToEnglish(order.quantity);
    int q = int.parse(qnt) + increment;
    setState(() {
      if (q < 0) q = 0;
      if(q>10) q = 10;
      String newQuantity = englishToBangla(q.toString());

      int index = _orders.indexOf(order);
      if (index != -1) {
        _orders[index] = order.copyWith(quantity: newQuantity);
      }
    });
    if(q==0){
      await deleteOrder(user.getUserID(), order);
    }
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        onPressed: () async {
          if(_orders.length==0){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kSecondaryColor,
                content: Text("কার্টে পণ্য যোগ করুন",),
              ),
            );
          }
          for (Orders order in _orders) {
            await updateOrder(user.getUserID(), order);
          }
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
      appBar: buildAppBar(context, 'আমার কার্ট'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: FetchPixels.getScale()*80), // Add padding to avoid content being hidden by the fixed button
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(FetchPixels.getScale()*16.0),
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
                  'পণ্য যোগ করুন',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Kalpurush',
                    fontWeight: FontWeight.bold,
                    color: kAccentColor,
                  ),
                ),
              ),
            ),
            FutureBuilder<List<Orders>>(
              future: _futureOrders,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('আপনার কার্টে কোন পণ্য নেই'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('আপনার কার্টে কোন পণ্য নেই'));
                }

                return Column(
                  children: _orders.map((order) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getScale()*16.0, vertical: FetchPixels.getScale()*8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(FetchPixels.getScale()*16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(FetchPixels.getScale()*8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Image(
                                      image: NetworkImage(order.image),
                                      height: FetchPixels.getPixelHeight(100),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
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
                                          '${order.amount}',
                                          style: TextStyle(
                                            fontFamily: 'Kalpurush',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            _updateQuantity(order, 1);
                                          },
                                          child: Icon(
                                            Icons.add_circle,
                                            color: kAccentColor,
                                          ),
                                        ),
                                        Text("${order.quantity}"),
                                        InkWell(
                                          onTap:(){
                                            _updateQuantity(order, -1);
                                          },
                                          child: Icon(
                                            Icons.remove_circle,
                                            color: kAccentColor,
                                          ),
                                        ),
                                      ],
                                    ),
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
