
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

AppBar buildAppBar(BuildContext context, String text) {
  return AppBar(
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
    title: Text(
      text,
      style: TextStyle(
        fontFamily: 'Kalpurush',
        color: kPrimaryColor,
      ),
    ),
  );
}