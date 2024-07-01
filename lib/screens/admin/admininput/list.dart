import 'package:firebase_database/firebase_database.dart';
import 'model.dart';

class ProductService {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref().child('products');

  Stream<List<Product>> getProducts() {
    return _databaseRef.onValue.map((event) {
      final dataSnapshot = event.snapshot;
      final Map<dynamic, dynamic>? values = dataSnapshot.value as Map?;
      if (values != null) {
        return values.entries.map((e) {
          // Gunakan DataSnapshot yang sudah ada
          final childSnapshot = dataSnapshot;
          return Product.fromSnapshot(childSnapshot);
        }).toList();
      } else {
        return [];
      }
    });
  }

  Future<void> addProduct(Product product) async {
    await _databaseRef.push().set(product.toJson());
  }

  Future<void> updateProduct(String key, Product product) async {
    await _databaseRef.child(key).update(product.toJson());
  }

  Future<void> deleteProduct(String key) async {
    await _databaseRef.child(key).remove();
  }
}