import 'package:flutter/material.dart';
import 'fashion_page7.dart';

class FashionPage1Screen extends StatelessWidget {
  const FashionPage1Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/girl1.png',
                                height: 270,
                                width: 170,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Modern Style Outfit",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: [
                                  const Text(
                                    "Rs 2399",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/boy1.png',
                                height: 225,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Modern Style Outfit",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: [
                                  const Text(
                                    "Rs 2399",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/boy2.png',
                                height: 225,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Modern Style Outfit",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: [
                                  const Text(
                                    "Rs 2399",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/girl2.png',
                                height: 270,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Modern Style Outfit",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: [
                                  const Text(
                                    "Rs 2399",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
           if (index == 1) {
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
             label: ' '
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.support_agent),
             label: ' '
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.person),
             label: ' ',
           ),
         ],

          ),
    );
  }

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
