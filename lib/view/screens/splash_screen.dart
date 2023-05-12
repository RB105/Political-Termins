import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: FadeIn(
          animate: true,
          delay: const Duration(milliseconds: 2000),
          child: Text(
            "Political Termins",
            style: TextStyle(
              color: Colors.grey.shade800,
                fontSize: 40,
                fontFamily: 'TiltPrism',
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
