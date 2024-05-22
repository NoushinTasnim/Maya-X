import 'package:flutter/material.dart';
import 'package:maya_x/model/user_model.dart';
import 'package:maya_x/utils/convert_sum.dart';
import 'package:maya_x/utils/load_json.dart';
import '../colors.dart';
import '../model/order.dart';
import '../utils/map_numbers.dart';
import 'my_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Usermodel user= Usermodel();
  late Future<List<Orders>> _futureOrders;

  @override
  void initState() {
    super.initState();
    _futureOrders = loadCheckouts(user.getUserID()).then((orders) {
      return orders;
    });
  }
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
              onTap: () {
                Navigator.push(
                  context,
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
      body: Center(
        child: FutureBuilder<List<Orders>>(
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
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'অর্ডার নং: ${order.id}',
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          'অর্ডারের তারিখ: ${englishToBangla("${order.date.day}-${order.date.month}-${order.date.year}")}',
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          'বিক্রেতা: ${order.vendor}',
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          '${order.quantity}x ${order.name}',
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          'সর্বমোট মূল্য:  ${multiplyBanglaAmounts(order.amount, order.quantity)} টাকা',
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}