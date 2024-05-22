class Product {
  final int id;
  final int index;
  final String name;
  final String amount;
  final String image;
  final String vendor;

  Product({
    required this.id,
    required this.index,
    required this.name,
    required this.amount,
    required this.image,
    required this.vendor,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      index: json['index'],
      name: json['name'],
      amount: json['amount'],
      image: json['image'],
      vendor: json['vendor'],
    );
  }
}