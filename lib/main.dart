

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/page/cart_page.dart';
import 'package:sushi/page/intro_page.dart';

import 'page/menupage.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(),
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage':(context) => const IntroPage(),
        '/menupage':(context) => const MenuPage(),
        '/cartpage':(context) => const CartPage(),
      },
    );
  }
}