import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/category.dart';
import 'package:maya_x/model/product.dart';
import 'package:maya_x/model/order.dart';

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

Future<List<Orders>> loadOrders() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference usersRef = firestore.collection('user');

  List<Orders> orders = [];

  // Assuming each user's orders are stored under their unique user ID
  QuerySnapshot usersSnapshot = await usersRef.get();

  for (var userDoc in usersSnapshot.docs) {
    CollectionReference ordersRef = userDoc.reference.collection('orders');
    QuerySnapshot ordersSnapshot = await ordersRef.get();

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
      );
      orders.add(order);
      print(order.date);
    }
  }
  print(orders);
  return orders;
}