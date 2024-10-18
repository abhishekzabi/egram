
import 'package:egram/presentation/pages/busmodule/bus_home_page.dart';
import 'package:egram/presentation/pages/home_page.dart';
import 'package:egram/presentation/pages/news/newshome.dart';
import 'package:egram/presentation/pages/taximodule/taxi_home.dart';
import 'package:egram/presentation/widgets/custombottomnav.dart';
import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  int _currentIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    HomePage(latitude: 12.266727050296513,longitude: 75.28165650485197,),
    CheemeniBus(),
    TaxiHome(),
    NewsFeedPage(),
  ];

  // Function to handle tab selection
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: _pages[_currentIndex],  // Display the selected page
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,   // Pass the current index
          onTap: onTabTapped,            // Pass the callback function to handle tap
        ),
      ),
    );
  }
}