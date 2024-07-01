import 'package:firebase_database/firebase_database.dart';

class Product {
  final String? key;
  final String name;
  final double price;

  Product({this.key, required this.name, required this.price});

  Product.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = (snapshot.value as Map?)?['name'] ?? '',
        price = double.tryParse(((snapshot.value as Map?)?['price'] ?? '0').toString()) ?? 0.0;

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
  };
}