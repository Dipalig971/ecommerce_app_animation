import 'package:ecommerce_app_animation/screen/ecommerce_app/view/cart/cart.dart';
import 'package:ecommerce_app_animation/screen/ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app_animation/screen/ecommerce_app/view/product/product_screen.dart';
import 'package:ecommerce_app_animation/screen/ecommerce_app/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const SplashScreen(),
        '/home':(context) =>  Homescreen(),
        '/product':(context) => Productscreen(),
        '/cart':(context) => Cartscreen(),
      },
    );
  }
}
