import 'package:flutter/material.dart';
import 'package:maya_x/utils/fetch_pixels.dart';
import '../colors.dart';
import '../model/user_model.dart';
import '../model/messages.dart';
import '../utils/load_json.dart';
import '../utils/map_numbers.dart';
import 'my_cart.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Usermodel user= Usermodel();
  late Future<List<Messages>> _futuremsg;

  @override
  void initState() {
    super.initState();
    _futuremsg = loadMessages(user.getUserID()).then((msgs) {
      return msgs;
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
        child: FutureBuilder<List<Messages>>(
          future: _futuremsg,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('আপনার কোন নোটিফিকেশন আসে নি'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('আপনার কোন নোটিফিকেশন আসে নি'));
            }
            final msgs = snapshot.data!;
            return ListView.builder(
              itemCount: msgs.length,
              itemBuilder: (context, index) {
                final msg = msgs[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(FetchPixels.getScale()*8.0),
                  child: Padding(
                    padding: EdgeInsets.all(FetchPixels.getScale()*16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              '${englishToBangla("${msg.date.day}-${msg.date.month}-${msg.date.year}  ${msg.date.hour}: ${msg.date.minute}")}',
                              style: TextStyle(
                                fontFamily: 'Kalpurush',
                                fontSize: 16,
                                color: kSecondaryColor.withOpacity(0.64),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: FetchPixels.getPixelHeight(8),
                        ),
                        Text(
                          '${msg.message}',
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
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
