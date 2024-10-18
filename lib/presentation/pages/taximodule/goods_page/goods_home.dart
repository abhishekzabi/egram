
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/presentation/pages/taximodule/goods_page/goods_driver.dart';
import 'package:egram/presentation/pages/taximodule/goods_page/tembo_driver.dart';
import 'package:flutter/material.dart';

class GoodsPage extends StatefulWidget {
  const GoodsPage({super.key});

  @override
  State<GoodsPage> createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
   int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        toolbarHeight: 200,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
           
             SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildSelectableContainer(0, "assets/images/goods.png"),
          const SizedBox(width: 10),
          buildSelectableContainer(1, "assets/images/tembo.png"),
          const SizedBox(width: 10),
        
        ],
      ),
    ),
  

           
          ],
        ),
      ),
      body:selectedIndex==0?const GoodsDriverPage():selectedIndex==1?const TemboDriverPage():Container()
    
    );
  }

  Widget buildSelectableContainer(int index, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color:  selectedIndex == index ? const Color.fromARGB(255, 63, 201, 160): const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            width: 2,
            color: selectedIndex == index ?const Color.fromARGB(255, 63, 201, 160) : const Color.fromARGB(255, 255, 95, 95),
          ),
          image: DecorationImage(image: AssetImage(imagePath)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
