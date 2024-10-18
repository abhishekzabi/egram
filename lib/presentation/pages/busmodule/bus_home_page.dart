
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/busmodule/cheemeni_buses.dart';
import 'package:egram/presentation/pages/busmodule/cherupuzha_buses.dart';
import 'package:flutter/material.dart';

class CheemeniBus extends StatefulWidget {
  @override
  State<CheemeniBus> createState() => _CheemeniBusState();
}

class _CheemeniBusState extends State<CheemeniBus> {
   @override

  final CollectionReference busDetailsCollection =
      FirebaseFirestore.instance.collection('CheemeniBusDetails');

bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor().scaffoldcolorwhite,
      appBar: AppBar(
        backgroundColor: Appcolor().scaffoldcolorwhite,
        automaticallyImplyLeading: false,
        toolbarHeight: 230,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/busservice.png"),fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              width: 260,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:const Color.fromARGB(255, 197, 183, 183)
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: isLoginPage
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: const Color.fromARGB(255, 63, 201, 160),
                         gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Appcolor().primaryone,
                Color.fromARGB(255, 134, 241, 186),
                
              ],
            ),
                      ),
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoginPage = true;
                            });
                          },
                          child: Center(
                            child: Text(
                              'Cheemeni ',
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    isLoginPage ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoginPage = false;
                            });
                          },
                          child: Center(
                            child: Text(
                              'Cherupuzha',
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    isLoginPage ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
 
          ],
        ),
      ),
      body:  isLoginPage ? const  CheemeniPage() :const  CherupuzhaPage(),
      
  
    );
  }
}
