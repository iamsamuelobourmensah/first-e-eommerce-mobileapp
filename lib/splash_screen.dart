import 'dart:async';

import 'package:ecommerce_2/signup_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
     void initState(){
    super.initState();
  Timer(const Duration(milliseconds:5500),
  (){
    Navigator.push(context,MaterialPageRoute(builder: (context){
return const SignupPage();

    }));
  }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
                       const Color.fromARGB(255, 6, 125, 223),
      
      
       body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/logo.png"))
        ),
      ),
    );
  }
}