
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/order.dart';

Future<void> saveOrder(String userId, Orders order) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ordersRef = firestore.collection('user').doc(userId).collection('orders');

  try {
    await ordersRef.doc(order.id).set(order.toJson());
    print("Order saved successfully!");
  } catch (e) {
    print("Failed to save order: $e");
  }
}

Future<void> updateOrder(String userId, Orders order) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ordersRef = firestore.collection('user').doc(userId).collection('orders');

  try {
    await ordersRef.doc(order.id).update(order.toJson());
    print("Order updated successfully!");
  } catch (e) {
    print("Failed to update order: $e");
  }
}

Future<void> deleteOrder(String userId, Orders order) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ordersRef = firestore.collection('user').doc(userId).collection('orders');

  try {
    await ordersRef.doc(order.id).delete();
    print("Order deleted successfully!");
  } catch (e) {
    print("Failed to delete order: $e");
  }
}

Future<void> saveCheckoutOrder(String userId, List<Orders> orders) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference checkoutRef = firestore.collection('user').doc(userId).collection('checkout');
  String timeNow = DateTime.now().toIso8601String(); // Use ISO 8601 format for better readability

  try {
    DocumentReference newCheckoutDoc = checkoutRef.doc(timeNow);
    // Set some initial data in the parent document
    await newCheckoutDoc.set({'timestamp': Timestamp.now()});

    for (var order in orders) {
      await newCheckoutDoc.collection('orders').add(order.toJson());
    }
    print("Orders saved successfully!");
  } catch (e) {
    print("Failed to save orders: $e");
  }
}
