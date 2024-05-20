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
        title: const Text(
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
                SizedBox(
                  height: 32,
                ),
                Text(
                  'ডেলিভারীর ঠিকানা',
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kAccent2,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        'images/image 26.png',
                        height: 32,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kAccent2,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        'images/image 27.png',
                        height: 32,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kAccent2,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
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
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.all(16),
            child: InkWell(
              onTap: (){
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
