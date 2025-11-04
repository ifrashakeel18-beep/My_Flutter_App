import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'fashion_page1.dart';
import 'login_page.dart';
import 'signup_Page.dart';

class FashionHomeScreen extends StatefulWidget {
  const FashionHomeScreen({super.key});

  @override
  _FashionHomeScreenState createState() => _FashionHomeScreenState();
}

class _FashionHomeScreenState extends State<FashionHomeScreen> {
  Future<void> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FashionPage1Screen()),
    );
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

            Image.asset(
              'assets/fullshotman.png',
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
                      MaterialPageRoute(builder: (context) => const signup_Page()),
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
                      MaterialPageRoute(builder: (context) => const login_page()),
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
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
                        child: Image.asset(
                          'assets/google.png',
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
                          MaterialPageRoute(builder: (context) => const FashionPage1Screen()),
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
