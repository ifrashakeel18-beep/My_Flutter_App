import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> saveImageData() async {
    try {
      final collection = _firestore.collection('HomeImages');

      final snapshot = await collection.limit(1).get();
      if (snapshot.docs.isNotEmpty) return;

      await collection.add({
        'name': 'Fullshot Man',
        'category': 'Men',
        'price': 0,
        'imageUrl':
        'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762258994/fullshotman_t7zw7f.png',
        'createdAt': FieldValue.serverTimestamp(),
      });

      await collection.add({
        'name': 'Google Icon',
        'category': 'Icon',
        'price': 0,
        'imageUrl':
        'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762261317/google_j10reu.png',
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('Images saved to Firestore!');
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  Future<void> signInWithGoogle(BuildContext context, Function onSuccess) async {
    try {
      _isLoading = true;
      notifyListeners();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      _isLoading = false;
      notifyListeners();

      onSuccess();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('Google Sign-In error: $e');
    }
  }
}
