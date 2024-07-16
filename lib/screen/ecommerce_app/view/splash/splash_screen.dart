import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

@override
  Widget build(BuildContext context) {
  Timer(const Duration(seconds: 5), () {
    Navigator.of(context).pushReplacementNamed('/home');
  });
    return const Scaffold(
      backgroundColor: Color(0xffF7E7DA),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image(
                image: AssetImage('assets/image/online-shop.png'),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 50.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
