
import 'package:flutter/cupertino.dart';
import 'package:maya_x/utils/fetch_pixels.dart';

import '../colors.dart';
import '../model/order.dart';
import '../utils/convert_sum.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.orders,
  });

  final List<Orders> orders;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: orders.map((order) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: FetchPixels.getScale()*4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${order.quantity}x ${order.name}',
                      style: TextStyle(
                          fontFamily: 'Kalpurush',
                          color: kSecondaryColor.withOpacity(.6)
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Text(
                      '${order.quantity}x ${order.amount} = ${multiplyBanglaAmounts(order.amount, order.quantity)} টাকা',
                      style: TextStyle(
                          fontFamily: 'Kalpurush',
                          color: kSecondaryColor.withOpacity(.6)
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}