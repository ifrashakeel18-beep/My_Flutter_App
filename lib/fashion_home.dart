import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_auth_provider.dart';
import 'package:provider/provider.dart';
import 'fashion_page1.dart';
import 'login_page.dart';
import 'signup_Page.dart';

class FashionHomeScreen extends StatefulWidget {
  const FashionHomeScreen({super.key});

  @override
  _FashionHomeScreenState createState() => _FashionHomeScreenState();
}

class _FashionHomeScreenState extends State<FashionHomeScreen> {
  final String imageUrl =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762258994/fullshotman_t7zw7f.png';
  final String imageUrl1 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762261317/google_j10reu.png';

  @override
  void initState() {
    super.initState();

    final userAuthProvider = Provider.of<UserAuthProvider>(context, listen: false);
    userAuthProvider.saveImageData();

    _saveHomeImagesToFirestore();
  }
  Future<void> _saveHomeImagesToFirestore() async {
    try {
      final collection = FirebaseFirestore.instance.collection('HomeImages');

      // Check if collection is empty
      final snapshot = await collection.limit(1).get();
      if (snapshot.docs.isNotEmpty) return; // Already saved, do nothing

      // Save the images
      await collection.add({
        'name': 'Fullshot Man',
        'imageUrl': imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });

      await collection.add({
        'name': 'Google Logo',
        'imageUrl': imageUrl1,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('Home images saved to Firestore!');
    } catch (e) {
      print('Error saving home images: $e');
    }
  }

  void _signInWithGoogle() {
    final authProvider = Provider.of<UserAuthProvider>(context, listen: false);
    authProvider.signInWithGoogle(context, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FashionPage1Screen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Fashion",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),

            Image.network(
              imageUrl,
              width: 350,
              height: 590,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const signup_Page()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Or",
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const login_page()),
                    );
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: _signInWithGoogle,
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Image.network(
                          imageUrl1,
                          height: 25,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const FashionPage1Screen()),
                        );
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
