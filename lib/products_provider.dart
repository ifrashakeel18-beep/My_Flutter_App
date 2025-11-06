import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_model.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final snapshot = await FirebaseFirestore.instance.collection('Products').get();

    _products = snapshot.docs.map((doc) {
      final data = doc.data();

      // Safely parse price
      int price = 0;
      if (data['price'] is int) {
        price = data['price'];
      } else if (data['price'] is String) {
        price = int.tryParse(data['price']) ?? 0;
      }

      return Product(
        id: doc.id,
        name: data['name'] ?? '',
        category: data['category'] ?? '',
        price: price,
        imageUrl: data['imageUrl'] ?? '',
      );
    }).toList();

    notifyListeners(); // Don't forget to notify listeners
  }
}
