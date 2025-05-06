import 'package:flutter/material.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_text.dart';
import 'package:vilcom_digital_restaurant/routes/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var circleWidth = context.screenWidth * 0.7;
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Stack(
        children: [
          // Background circles
          Positioned(
            top: -40,
            right: -100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.circle,
              ),
              width: circleWidth,
              height: circleWidth,
            ),
          ),

          Positioned(
            bottom: -70,
            left: -100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.circle,
              ),
              width: circleWidth - 20,
              height: circleWidth - 20,
            ),
          ),

          Center(
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vilcom',
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  CText(
                    text: 'Digital',
                    size: 60,
                    fontWeight: FontWeight.bold,
                    // style: TextStyle(
                    //   fontSize: 60,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.white,
                    // ),
                  ),
                  Text(
                    'Restaurant',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            // left: 0,
            right: context.screenWidth * 0.2,
            child: const Text(
              'Powered by BraveTech',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),

          Positioned(
            bottom: 70,
            right: -20,
            child: Container(
              width: context.screenWidth * 0.8,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
              ),
              child: Center(
                child: CText(
                  text: 'Get Started',
                  color: context.primary,
                  size: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
