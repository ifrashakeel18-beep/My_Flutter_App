import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'fashion_home.dart';
import 'signup_Page.dart';
import 'user_auth_provider.dart';
import 'products_provider.dart';
import 'products_stream_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();


  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserAuthProvider()),
          ChangeNotifierProvider(create: (_) => ProductsProvider()),
          ChangeNotifierProvider(create: (_) => ProductsStreamProvider()),


        ],
      child: const MyApp(),
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FashionHomeScreen(),
    );
  }
}
