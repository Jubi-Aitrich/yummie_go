import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yammiego/Controller/cart_provider.dart';
import 'package:yammiego/View/splash.dart';

void main() {
   runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const SplashScreen(),
    );
  }
}