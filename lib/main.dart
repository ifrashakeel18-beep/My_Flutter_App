<<<<<<< HEAD
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
=======
import 'package:api_project1/login.dart';
import 'package:api_project1/screen2.dart';
import 'package:api_project1/screen3.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp(),
    );

>>>>>>> 8b54285 (api's practice)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FashionHomeScreen(),
=======
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen3(),
>>>>>>> 8b54285 (api's practice)
    );
  }
}
