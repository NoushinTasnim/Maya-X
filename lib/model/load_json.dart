import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'category.dart';
import 'package:maya_x/model/product.dart';
import 'package:maya_x/model/order.dart';

//
// Future<List<Category>> loadCategories() async {
//   final String response = await rootBundle.loadString('assets/products.json');
//   final data = json.decode(response) as Map<String, dynamic>;
//   var categoriesFromJson = data['categories'] as List;
//   return categoriesFromJson.map((json) => Category.fromJson(json)).toList();
// }

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
  final String response = await rootBundle.loadString('assets/orders.json');
  final data = json.decode(response) as Map<String, dynamic>;
  var ordersFromJson = data['orders'] as List;
  return ordersFromJson.map((json) => Orders.fromJson(json)).toList();
}

