import 'package:flutter/material.dart';
import 'package:maya_x/model/user_model.dart';
import 'package:maya_x/utils/convert_sum.dart';
import 'package:maya_x/utils/fetch_pixels.dart';
import 'package:maya_x/utils/load_json.dart';
import '../colors.dart';
import '../model/order.dart';
import '../utils/map_numbers.dart';
import 'my_cart.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

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
    FetchPixels(context);
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
            padding: EdgeInsets.all(FetchPixels.getScale()*16.0),
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
              return Center(child: Text('আপনার কোন পূর্বের অর্ডার নেই'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('আপনার কোন পূর্বের অর্ডার নেই'));
            }
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(FetchPixels.getScale()*8.0),
                  child: Padding(
                    padding: EdgeInsets.all(FetchPixels.getScale()*16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: kSecondaryColor.withOpacity(0.64),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${englishToBangla("${order.date.day}-${order.date.month}-${order.date.year}")}',
                                  style: TextStyle(
                                    fontFamily: 'Kalpurush',
                                    fontSize: 16,
                                    color: kSecondaryColor.withOpacity(0.64),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: FetchPixels.getScale()*8, vertical: FetchPixels.getScale()*4),
                              decoration: (order.status == 'কনফার্ম') ? BoxDecoration(
                                  color: kAccentColor,
                                  borderRadius: BorderRadius.circular(FetchPixels.getScale()*8)
                              ) : BoxDecoration(
                                  border: Border.all(
                                    color: kAccentColor
                                  ),
                                  borderRadius: BorderRadius.circular(FetchPixels.getScale()*8)
                              ),
                              child: Text(
                                '${order.status}',
                                style: TextStyle(
                                  fontFamily: 'Kalpurush',
                                  fontSize: FetchPixels.getTextScale()*16,
                                  color: (order.status == 'কনফার্ম') ? kPrimaryColor : kAccentColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image(
                                image: NetworkImage(order.image),
                                height: FetchPixels.getPixelHeight(100),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${order.quantity}x ${order.name}',
                                    style: TextStyle(
                                      fontFamily: 'Kalpurush',
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                  Text(
                                    '#${order.id}',
                                    style: TextStyle(
                                      fontFamily: 'Kalpurush',
                                      color: kSecondaryColor.withOpacity(.64),
                                    ),
                                  ),
                                  Text(
                                    'সর্বমোট মূল্য:  ${multiplyBanglaAmounts(order.amount, order.quantity)} টাকা',
                                    style: TextStyle(
                                      fontFamily: 'Kalpurush',
                                      fontSize: FetchPixels.getTextScale()*16,
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            (order.status=='পেন্ডিং') ?'আপনার অর্ডারটি বিক্রেতা কর্তৃক কনফার্ম হবার অপেক্ষায় আছে': 'আপনার অর্ডারটি বিক্রেতা কর্তৃক কনফার্ম হয়েছে',
                            style: TextStyle(
                              fontFamily: 'Kalpurush',
                              color: kSecondaryColor.withOpacity(.64),
                              fontSize: FetchPixels.getTextScale()*12
                            ),
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