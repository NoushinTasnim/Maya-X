import 'package:flutter/material.dart';

import '../colors.dart';
import 'bottom_nav_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kAccentColor,
        title: Text(
          'চেকআউট',
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
                                    fontFamily: 'Kalpurush'
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
                                    fontFamily: 'Kalpurush'
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
          )
        ],
      ),
    );
  }
}
