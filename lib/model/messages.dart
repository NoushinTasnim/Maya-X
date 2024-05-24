import 'package:cloud_firestore/cloud_firestore.dart';

class Messages{
  final String message;
  final DateTime date;

  Messages({
    required this.message,
    required this.date,
  });
}
