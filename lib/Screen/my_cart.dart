import 'package:flutter/material.dart';
import 'package:maya_x/Screen/bottom_nav_screen.dart';
import 'package:maya_x/Screen/checkout_screen.dart';
import 'package:maya_x/colors.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kAccentColor,
        title: Text(
            'আমার কার্ট',
            style: TextStyle(
              fontFamily: 'Kalpurush'
            ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'আরও পণ্য যোগ করুন',
                      style: TextStyle(
                        fontFamily: 'Kalpurush',
                        fontWeight: FontWeight.bold,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/image 2.png',
                            height: 100,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ফ্রিডম Super Dry স্যানিটারী ন্যাপকিন - ৮টি প্যাড',
                                  style: TextStyle(
                                      fontFamily: 'Kalpurush',
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '১১০ টাকা',
                                  style: TextStyle(
                                      fontFamily: 'Kalpurush'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    if(_counter<10)
                                      _counter++;
                                  });
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  color: kAccentColor,
                                ),
                              ),
                              Text(
                                '$_counter'
                              ),
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    if(_counter>0)
                                      _counter--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: kAccentColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/image 2.png',
                            height: 100,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ফ্রিডম Super Dry স্যানিটারী ন্যাপকিন - ৮টি প্যাড',
                                  style: TextStyle(
                                      fontFamily: 'Kalpurush',
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '১১০ টাকা',
                                  style: TextStyle(
                                      fontFamily: 'Kalpurush'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: kAccentColor,
                              ),
                              Text(
                                  '১'
                              ),
                              Icon(
                                Icons.remove_circle,
                                color: kAccentColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '১x ফ্রিডম Super Dry স্যানিটারী ন্যাপকিন - ৮টি প্যাডঃ ',
                      style: TextStyle(
                          fontFamily: 'Kalpurush',
                          color: kSecondaryColor.withOpacity(.6)
                      ),
                    ),
                    Text(
                      '১১০ টাকা',
                      style: TextStyle(
                          fontFamily: 'Kalpurush',
                          color: kSecondaryColor.withOpacity(.6)
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '১x ফ্রিডম Super Dry স্যানিটারী ন্যাপকিন - ৮টি প্যাডঃ ',
                      style: TextStyle(
                          fontFamily: 'Kalpurush',
                          color: kSecondaryColor.withOpacity(.6)
                      ),
                    ),
                    Text(
                      '১১০ টাকা',
                      style: TextStyle(
                          fontFamily: 'Kalpurush',
                          color: kSecondaryColor.withOpacity(.6)
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
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
                  padding: const EdgeInsets.only(top: 16.0),
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
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kAccentColor,
              borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.all(16),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => CheckOutScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'চেকআউট করুন',
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
          ),
        ],
      ),
    );
  }
}
