import 'package:cloud_firestore/cloud_firestore.dart';

class Orders{
  final String id;
  final String name;
  final int quantity;
  final String image;
  final DateTime date;
  final String amount;

  Orders({
    required this.id,
    required this.name,
    required this.quantity,
    required this.image,
    required this.date,
    required this.amount,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      image: json['image'],
      date: (json['date'] as Timestamp).toDate(),
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'image': image,
      'date': date,
      'amount': amount,
    };
  }
}
