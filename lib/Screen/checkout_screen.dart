import 'package:flutter/material.dart';
import 'package:maya_x/Screen/order_confirmation_screen.dart';

import '../colors.dart';
import '../model/load_json.dart';
import '../model/order.dart';
import 'bottom_nav_screen.dart';

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

  @override
  void initState() {
    super.initState();
    _futureOrders = loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
        title: const Text(
          'চেকআউট',
          style: TextStyle(
            fontFamily: 'Kalpurush',
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'অর্ডার সারাংশ',
                  style: TextStyle(
                      fontFamily: 'Kalpurush',
                      fontSize: 20,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 16,
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
                    return Column(
                      children: orders.map((order) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                order.name,
                                style: TextStyle(
                                    fontFamily: 'Kalpurush',
                                    color: kSecondaryColor.withOpacity(.6)
                                ),
                              ),
                              Text(
                                order.amount,
                                style: TextStyle(
                                    fontFamily: 'Kalpurush',
                                    color: kSecondaryColor.withOpacity(.6)
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                        '২৭০ টাকা',
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
                      fontSize: 20,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  style: TextStyle(
                    fontFamily: 'Kalpurush',
                    color: kSecondaryColor.withOpacity(.64),
                  ),
                  cursorColor: Theme.of(context).cardColor,
                  decoration: InputDecoration(
                    labelText: 'ঠিকানা',
                    labelStyle:  TextStyle(
                        fontFamily: 'Kalpurush',
                        color: kSecondaryColor.withOpacity(.64),
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),
                    filled: true,
                    fillColor: Theme.of(context).canvasColor.withOpacity(0.45),
                    prefixIcon: Icon(
                      Icons.my_location,
                      color: kSecondaryColor.withOpacity(.64),
                      size: 20,
                    ),
                    hintText: 'ঠিকানা',
                    hintStyle: Theme.of(context).textTheme.titleSmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red), // Set the error border color to red
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (val) {

                  },
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'পেমেন্টের মাধ্যম',
                  style: TextStyle(
                      fontFamily: 'Kalpurush',
                      fontSize: 20,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 16,
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
                          borderRadius: BorderRadius.circular(8),
                        ):
                        BoxDecoration(
                          color: kAccent2,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
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
                          borderRadius: BorderRadius.circular(8),
                        ):
                        BoxDecoration(
                          color: kAccent2,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          'images/image 27.png',
                          height: 32,
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
                          borderRadius: BorderRadius.circular(8),
                        ):
                        BoxDecoration(
                          color: kAccent2,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: const SizedBox(
                          height: 32,
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
                borderRadius: BorderRadius.circular(16)
            ): BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16)
            ),
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: (){
                if(!(_bkashPay | _nagadPay | _codPay )){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: kSecondaryColor,
                      content: Text("পেমেন্টের মাধ্যম নির্বাচন করুন",),
                    ),
                  );
                }
                else{
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> OrderConfirmation())
                  );
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
                      fontSize: 16,
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
    );
  }
}
