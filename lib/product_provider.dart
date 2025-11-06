import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get all products as a live stream
  Stream<QuerySnapshot> get productsStream =>
      _firestore.collection('Products').snapshots();

  /// Update price of a product
  Future<void> updatePrice(String productId, double newPrice) async {
    await _firestore.collection('Products').doc(productId).update({
      'price': newPrice,
    });
    notifyListeners();
  }

  /// Add new product (optional)
  Future<void> addProduct(Map<String, dynamic> productData) async {
    await _firestore.collection('Products').add(productData);
    notifyListeners();
  }
}
