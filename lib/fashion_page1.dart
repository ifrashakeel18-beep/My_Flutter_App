import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'fashion_page7.dart';
import 'fashion_home.dart';
import 'user_auth_provider.dart';
import 'package:provider/provider.dart';
import 'products_provider.dart';
// Product model
class Products {
  final String id;
  final String name;
  final String category;
  final int price;
  final String imageUrl;

  Products({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });
}

class FashionPage1Screen extends StatefulWidget {
  const FashionPage1Screen({super.key});

  @override
  State<FashionPage1Screen> createState() => _FashionPage1ScreenState();
}

class _FashionPage1ScreenState extends State<FashionPage1Screen> {
  // Keep your existing image URLs (optional fallback)
  final String imageUrl2 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762273819/girl5_rdz8nm.png';
  final String imageUrl3 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762271282/girl4_dlowte.png';
  final String imageUrl4 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762271200/girl3_goncxu.png';
  final String imageUrl5 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762271095/boy4_v7zmrw.png';
  final String imageUrl6 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762271042/girl2_wudtup.png';
  final String imageUrl7 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762270992/boy2_oxdmqs.png';
  final String imageUrl8 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762270914/boy3_c1toaj.png';
  final String imageUrl9 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762270816/girl1_bmlqpw.png';
  final String imageUrl10 =
      'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762258994/fullshotman_t7zw7f.png';

  @override
  void initState() {
    super.initState();
    _saveImageUrlToFirestore();
  }

  // Save images to Firestore (optional, only first-time use)
  Future<void> _saveImageUrlToFirestore() async {
    try {
      final collection = FirebaseFirestore.instance.collection('Products');
      final snapshot = await collection.limit(1).get();
      if (snapshot.docs.isNotEmpty) return;

      await collection.add({
        'name': 'Girl Image 1',
        'category': 'Women',
        'price': 2300,
        'imageUrl': imageUrl2,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Men Image 1',
        'category': 'Men',
        'price': 2399,
        'imageUrl': imageUrl3,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Men Image 2',
        'category': 'Men',
        'price': 2399,
        'imageUrl': imageUrl4,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Girl Image 2',
        'category': 'Women',
        'price': 2399,
        'imageUrl': imageUrl5,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Men Image 3',
        'category': 'Men',
        'price': 2399,
        'imageUrl': imageUrl6,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Girl Image 3',
        'category': 'Women',
        'price': 2399,
        'imageUrl': imageUrl7,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Girl Image 4',
        'category': 'Women',
        'price': 2399,
        'imageUrl': imageUrl8,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Girl Image 5',
        'category': 'Women',
        'price': 2399,
        'imageUrl': imageUrl9,
        'createdAt': FieldValue.serverTimestamp(),
      });
      await collection.add({
        'name': 'Men Image 4',
        'category': 'Men',
        'price': 2399,
        'imageUrl': imageUrl10,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('All Images URL saved to Firestore!');
    } catch (e) {
      print('Error saving image URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAuthProvider =
    Provider.of<UserAuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        toolbarHeight: 200,
        titleSpacing: 16,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Fashion",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                suffixIcon: const Icon(Icons.tune, color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryChip("All", false),
                    categoryChip("Men", true),
                    categoryChip("Women", true),
                    categoryChip("Shirts", true),
                    categoryChip("Pants", true),
                    categoryChip("Outfit", true),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "All Collections",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Here is the live fetch from Firebase
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                  FirebaseFirestore.instance.collection('Products').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final products = snapshot.data!.docs.map((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      return Products(
                        id: doc.id,
                        name: data['name'] ?? '',
                        category: data['category'] ?? '',
                        price: data['price'] ?? 0,
                        imageUrl: data['imageUrl'] ?? '',
                      );
                    }).toList();

                    final filteredProducts = products.where((p){
                      return p.imageUrl !=
                          'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762258994/fullshotman_t7zw7f.png' &&
                          p.imageUrl !=
                              'https://res.cloudinary.com/dhkqq5fug/image/upload/v1762261317/google_j10reu.png';
                    }).toList();

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < products.length; i += 2)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildProductColumn(products[i]),
                                const SizedBox(width: 12),
                                if (i + 1 < products.length)
                                  buildProductColumn(products[i + 1]),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[200],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FashionHomeScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FashionPage7Screen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fire_truck_rounded),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' ',
          ),
        ],
      ),
    );
  }

  // Helper method for product card
  Widget buildProductColumn(Products product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(product.imageUrl, height: 225, width: 180, fit: BoxFit.cover),
        const SizedBox(height: 8),
        Text(product.name,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 0),
        Row(
          children: [
            Text("Rs ${product.price}",
                style: const TextStyle(fontSize: 14, color: Colors.black)),
            const SizedBox(width: 60),
            IconButton(
              onPressed: () {},
              icon:
              const Icon(Icons.shopping_cart_outlined, size: 20, color: Colors.black),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }

  // Category Chip
  Widget categoryChip(String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.brown[100] : Colors.brown[200],
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.brown.shade400,
          width: 1,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.black : Colors.brown[700],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
