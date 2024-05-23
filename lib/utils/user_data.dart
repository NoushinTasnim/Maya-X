import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

Future<bool> checkUserExists(String phone) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('user')
      .where('phone', isEqualTo: phone)
      .get();
  return querySnapshot.docs.isNotEmpty;
}

Future<void> saveUserData(String uid, TextEditingController phoneController,TextEditingController passwordController,TextEditingController userController) async {
  CollectionReference collref = FirebaseFirestore.instance.collection('user');
  await collref.doc(uid).set({
    'phone': phoneController.text.trim(),
    'password': passwordController.text.trim(),
    'name': userController.text.trim(),
    'userID': uid,
  });
}