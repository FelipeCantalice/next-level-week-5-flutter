import 'package:flutter/material.dart';
import 'package:nlw_5/core/app_gradients.dart';
import 'package:nlw_5/core/core.dart';
import 'package:nlw_5/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // navegar para a home page
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
