
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/taximodule/auto_taxi_page.dart';
import 'package:egram/presentation/pages/taximodule/goods_page/goods_home.dart';
import 'package:flutter/material.dart';

class TaxiHome extends StatefulWidget {
  const TaxiHome({super.key});

  @override
  State<TaxiHome> createState() => _TaxiHomeState();
}

class _TaxiHomeState extends State<TaxiHome> {
  bool isLoginPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 250,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/taxi.png")),
                ),
              ),
            ),
            Container(
              width: 260,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[300],
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
                              'Auto/Taxi ',
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
                              'Pickup/Goods',
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
        body:  isLoginPage ? const  AutoTaxiPage() :const  GoodsPage(),
    );
  }
}