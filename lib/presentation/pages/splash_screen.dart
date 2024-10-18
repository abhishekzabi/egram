
import 'dart:async';

import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/entrypage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start the timer to navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EntryPage(),
        ),
      );
    });

    // Delay to start the fade-in animation for the text
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Begin the opacity transition
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor().primaryone,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Appcolor().primaryone,
                    image: DecorationImage(
                      image: AssetImage("assets/images/egram.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Animated text
              AnimatedOpacity(
                opacity: _opacity, // Controlled by state
                duration: Duration(seconds: 1), // Fade duration
                child: Text(
                  "Connecting Village, Empowering Community",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              const SpinKitCircle(size: 60, color: Color.fromARGB(255, 255, 255, 255)),

            
            ],
          ),
        ],
      ),
    );
  }
}
