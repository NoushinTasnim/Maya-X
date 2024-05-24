import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/User_model.dart';
import '../model/category.dart';
import 'package:maya_x/model/product.dart';
import 'package:maya_x/model/order.dart';

import '../model/messages.dart';

Future<List<Category>> loadCategories() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference categoriesRef = firestore.collection('categories');

  QuerySnapshot categoriesSnapshot = await categoriesRef.get();
  List<Category> categories = [];

  for (var categoryDoc in categoriesSnapshot.docs) {
    Map<String, dynamic> categoryData = categoryDoc.data() as Map<String, dynamic>;
    QuerySnapshot productsSnapshot = await categoryDoc.reference.collection('products').get();
    List<Product> products = [];

    for (var productDoc in productsSnapshot.docs) {
      Map<String, dynamic> productData = productDoc.data() as Map<String, dynamic>;
      products.add(Product.fromJson(productData));
    }
    Category category = Category(
      id: categoryData['id'],
      name: categoryData['name'] as String,
      products: products,
    );

    categories.add(category);
  }

  return categories;
}

Future<List<Orders>> loadOrders(String userId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  print("ss"+userId);
  CollectionReference usersRef = firestore.collection('user').doc(userId).collection('orders');

  List<Orders> orders = [];

    QuerySnapshot ordersSnapshot = await usersRef.get();
    print("Fetched checkout documents: ${ordersSnapshot.docs.length}"); // Debug statement

    for (var orderDoc in ordersSnapshot.docs) {
      Map<String, dynamic> orderData = orderDoc.data() as Map<String, dynamic>;
      Orders order = Orders(
        id: orderData['id'],
        name: orderData['name'],
        quantity: orderData['quantity'],
        image: orderData['image'],
        date: (orderData['date'] as Timestamp).toDate(),
        amount: orderData['amount'],
        vendor: orderData['vendor'],
        status: orderData['status'],
      );
      orders.add(order);
      print(order.date);
    }
  return orders;
}

Future<List<Orders>> loadCheckouts(String userId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  print("ss"+userId);
  CollectionReference checkoutRef = firestore.collection('user').doc(userId).collection('checkout');

  List<Orders> orders = [];

  try {
    QuerySnapshot checkoutsSnapshot = await checkoutRef.get();
    print("Fetched checkout documents: ${checkoutsSnapshot.docs.length}"); // Debug statement

    for (var checkoutDoc in checkoutsSnapshot.docs) {
      print("Processing checkout document: ${checkoutDoc.id}"); // Debug statement
      QuerySnapshot ordersDetailsSnapshot = await checkoutDoc.reference.collection('orders').get();
      print("Fetched orders for checkout document: ${ordersDetailsSnapshot.docs.length}"); // Debug statement

      for (var orderDetailDoc in ordersDetailsSnapshot.docs) {
        Map<String, dynamic> orderData = orderDetailDoc.data() as Map<String, dynamic>;
        Orders order = Orders(
          id: orderData['id'],
          name: orderData['name'],
          quantity: orderData['quantity'],
          image: orderData['image'],
          date: (orderData['date'] as Timestamp).toDate(),
          amount: orderData['amount'],
          vendor: orderData['vendor'],
          status: orderData['status'],
        );
        print("Order fetched: ${order.name}"); // Debug statement
        orders.add(order);
      }
    }
    print("Orders loaded successfully!");
  } catch (e) {
    print("Failed to load orders: $e");
  }

  return orders;
}

Future<List<Messages>> loadMessages(String userId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  print("ss"+userId);
  CollectionReference usersRef = firestore.collection('user').doc(userId).collection('messages');

  List<Messages> msgs = [];

  try {
    QuerySnapshot messagesSnapshot = await usersRef.get();
    print("Fetched message documents: ${messagesSnapshot.docs.length}"); // Debug statement

    for (var messageDoc in messagesSnapshot.docs) {
      Map<String, dynamic> messageData = messageDoc.data() as Map<String, dynamic>;
      print("Fetched message: ${messageData['message']}"); // Debug statement

      Messages msg = Messages(
        message: messageData['message'],
        date: (messageData['timestamp'] as Timestamp).toDate(),
      );

      msgs.add(msg);
      print("Message Date: ${msg.date}, Message: ${msg.message}"); // Debug statement
    }
  } catch (e) {
    print("Failed to load messages: $e");
  }
  return msgs;
}