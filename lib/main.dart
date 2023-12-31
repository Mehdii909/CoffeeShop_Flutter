import 'package:coffeeshop_flutter/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'pages/home_page.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=> CoffeeShop(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SplashScreen(),
      )
      );
}
}
