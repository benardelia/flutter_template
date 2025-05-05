import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_text.dart';
import 'package:vilcom_digital_restaurant/utils/constants/assets.dart';

import '../../config/styles/input_decorator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            spacing: size.height * 0.02,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.25),
              Center(
                child: CText(
                  text: 'vilcom digital restaurant',
                  fontWeight: FontWeight.bold,
                  size: 23,
                  // style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
        
              Center(child: CText(text: 'Login', size: 23)),

              TextField(
                
                decoration: InputDecorationX.decorator(
                  
                  label: 'Username',
                  icon: HugeIcons.strokeRoundedUser,
                ),
              ),

              TextField(
                decoration: InputDecorationX.decorator(
                  label: 'Password',
                  icon: HugeIcons.strokeRoundedLockPassword,
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: Size.fromWidth(size.width),
                  backgroundColor: context.primary,
                ),
                child: const Text('Login', style: TextStyle(fontSize: 20)),
              ),

        

           
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
