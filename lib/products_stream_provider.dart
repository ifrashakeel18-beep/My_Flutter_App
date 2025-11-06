import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsStreamProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Using Map for simplicity
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> get products => _products;

  Stream<List<Map<String, dynamic>>> getProductsStream() {
    return _firestore.collection('Products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }
}
