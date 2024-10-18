import 'package:egram/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


void main()async {
 WidgetsFlutterBinding.ensureInitialized(); 
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Egram',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
      
    );
  }
}


//web       1:900321327886:web:48e0b092b170f8202eb55f
// android   1:900321327886:android:b1e84d6d93b99e1c2eb55f
// ios       1:900321327886:ios:656e6fa651fc862d2eb55f