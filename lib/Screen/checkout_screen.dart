import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya_x/Screen/order_confirmation_screen.dart';
import 'package:maya_x/model/user_model.dart';
import 'package:maya_x/utils/fetch_pixels.dart';
import 'package:maya_x/utils/map_numbers.dart';
import 'package:maya_x/utils/store_json.dart';
import '../colors.dart';
import '../components/appbar.dart';
import '../components/order_summary.dart';
import '../components/text_fields.dart';
import '../utils/convert_sum.dart';
import '../utils/load_json.dart';
import '../model/order.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool _bkashPay = false;
  bool _nagadPay = false;
  bool _codPay = false;
  late Future<List<Orders>> _futureOrders;
  TextEditingController adressController = TextEditingController();
  double totalSum = 0.0;

  @override
  void initState() {
    super.initState();
    _futureOrders = loadOrders(Usermodel().getUserID()).then((orders) {
      setState(() {
        totalSum = calculateTotalSum(orders);
      });
      return orders;
    });
  }


  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context, 'চেকআউট'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(FetchPixels.getScale()*16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'অর্ডার সারাংশ',
                    style: TextStyle(
                        fontFamily: 'Kalpurush',
                        fontSize: FetchPixels.getTextScale()*20,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(16),
                  ),
                  FutureBuilder<List<Orders>>(
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
                      return OrderSummary(orders: orders);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: FetchPixels.getScale()*8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ডেলিভারী চার্জঃ ',
                          style: TextStyle(
                              fontFamily: 'Kalpurush',
                              color: kSecondaryColor.withOpacity(.6)
                          ),
                        ),
                        Text(
                          '৫০ টাকা',
                          style: TextStyle(
                              fontFamily: 'Kalpurush',
                              color: kSecondaryColor.withOpacity(.6)
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: kSecondaryColor.withOpacity(.2),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: FetchPixels.getScale()*16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'সর্বমোটঃ ',
                          style: TextStyle(
                              fontFamily: 'Kalpurush',
                              color: kSecondaryColor
                          ),
                        ),
                        Text(
                          '${englishToBangla(totalSum.toString())} টাকা',
                          style: TextStyle(
                              fontFamily: 'Kalpurush',
                              color: kSecondaryColor
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'অর্ডারকারীর ঠিকানা',
                    style: TextStyle(
                        fontFamily: 'Kalpurush',
                        fontSize: FetchPixels.getTextScale()*20,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(16),
                  ),
                  TextFieldWidget(
                    text: 'ঠিকানা',
                    iconData: Icons.location_on_outlined,
                    textInputController: adressController,
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(32),
                  ),
                  Text(
                    'পেমেন্টের মাধ্যম',
                    style: TextStyle(
                        fontFamily: 'Kalpurush',
                        fontSize: FetchPixels.getTextScale()*20,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: FetchPixels.getPixelHeight(16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(!_bkashPay) {
                              _bkashPay = true;
                              if (_codPay) _codPay = false;
                              if (_nagadPay) _nagadPay = false;
                            }
                            else
                              _bkashPay = false;
                          });
                        },
                        child: Container(
                          decoration: !_bkashPay? BoxDecoration(
                            border: Border.all(
                              color: kAccent2,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(FetchPixels.getScale()*8),
                          ):
                          BoxDecoration(
                            color: kAccent2,
                            borderRadius: BorderRadius.circular(FetchPixels.getScale()*8),
                          ),
                          padding: EdgeInsets.all(FetchPixels.getScale()*8),
                          child: Image.asset(
                            'images/image 26.png',
                            height: 32,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(!_nagadPay) {
                              _nagadPay = true;
                              if (_codPay) _codPay = false;
                              if (_bkashPay) _bkashPay = false;
                            }
                            else
                              _nagadPay = false;
                          });
                        },
                        child: Container(
                          decoration:  !_nagadPay? BoxDecoration(
                            border: Border.all(
                              color: kAccent2,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(FetchPixels.getScale()*8),
                          ):
                          BoxDecoration(
                            color: kAccent2,
                            borderRadius: BorderRadius.circular(FetchPixels.getScale()*8),
                          ),
                          padding: EdgeInsets.all(FetchPixels.getScale()*8),
                          child: Image.asset(
                            'images/image 27.png',
                            height: FetchPixels.getPixelHeight(32),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(!_codPay) {
                              _codPay = true;
                              if (_nagadPay) _nagadPay = false;
                              if (_bkashPay) _bkashPay = false;
                            }
                            else
                              _codPay = false;
                          });
                        },
                        child: Container(
                          decoration: !_codPay? BoxDecoration(
                            border: Border.all(
                              color: kAccent2,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(FetchPixels.getScale()*8),
                          ):
                          BoxDecoration(
                            color: kAccent2,
                            borderRadius: BorderRadius.circular(FetchPixels.getScale()*8),
                          ),
                          padding: EdgeInsets.all(FetchPixels.getScale()*8),
                          child: SizedBox(
                            height: FetchPixels.getPixelHeight(32),
                            child: Center(
                              child: Text(
                                'ক্যাশ অন ডেলিভারী',
                                style: TextStyle(
                                  fontFamily: 'Sirajee',
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: (_bkashPay | _nagadPay | _codPay )  ? BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(FetchPixels.getScale()*16)
              ): BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(FetchPixels.getScale()*16)
              ),
              padding: EdgeInsets.all(FetchPixels.getScale()*16),
              child: InkWell(
                onTap: () async {
                  if(!(_bkashPay | _nagadPay | _codPay )){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: kSecondaryColor,
                        content: Text("পেমেন্টের মাধ্যম নির্বাচন করুন",),
                      ),
                    );
                  }
                  else{
                    String? userId = FirebaseAuth.instance.currentUser?.uid;
                    try {
                      List<Orders> orders = await _futureOrders;
                      await saveCheckoutOrder(userId!, orders);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OrderConfirmation()),
                      );
                    } catch (e) {
                      print('Error loading orders: $e');
                      // Handle error loading orders
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'অর্ডার কনফার্ম করুন',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: 'Kalpurush',
                        fontSize: FetchPixels.getTextScale()*16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: kPrimaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}