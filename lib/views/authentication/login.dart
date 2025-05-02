import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
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
      // backgroundColor: Color.fromARGB(255, 237, 224, 205),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            spacing: size.height * 0.02,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Center(
                child: CText(
                  text: 'vilcom digital restaurant',
                  fontWeight: FontWeight.bold,
                  size: 23,
                  // style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      scooter,
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                    ),
                  ),
                ),
              ),
              CText(text: 'Login', size: 25),

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
                  Navigator.pushNamed(context, '/homepage');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: Size.fromWidth(size.width),
                  backgroundColor: Color.fromARGB(255, 122, 88, 43),
                ),
                child: const Text('Login', style: TextStyle(fontSize: 20)),
              ),

              Stack(
                children: [
                  Divider(height: 30,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('Or continue with'),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      google,
                      width: size.width * 0.18,
                      height: size.width * 0.18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      facebook,
                      width: size.width * 0.18,
                      height: size.width * 0.18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      apple,
                      width: size.width * 0.18,
                      height: size.width * 0.18,
                    ),
                  ),
                ],
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
