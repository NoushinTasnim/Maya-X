class Order {
  final int id;
  final int index;
  final int quantity;
  final String name;
  final String date;
  final String amount;
  final String image;

  Order({
    required this.id,
    required this.index,
    required this.quantity,
    required this.name,
    required this.amount,
    required this.date,
    required this.image,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      index: json['index'],
      name: json['name'],
      quantity: json['quantity'],
      amount: json['amount'],
      date: json['date'],
      image: json['image'],
    );
  }
}