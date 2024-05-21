import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'category.dart';
import 'order.dart';

Future<List<Category>> loadCategories() async {
  final String response = await rootBundle.loadString('assets/products.json');
  final data = json.decode(response) as Map<String, dynamic>;
  var categoriesFromJson = data['categories'] as List;
  return categoriesFromJson.map((json) => Category.fromJson(json)).toList();
}

Future<List<Order>> loadOrders() async {
  final String response = await rootBundle.loadString('assets/orders.json');
  final data = json.decode(response) as Map<String, dynamic>;
  var ordersFromJson = data['orders'] as List;
  return ordersFromJson.map((json) => Order.fromJson(json)).toList();
}
