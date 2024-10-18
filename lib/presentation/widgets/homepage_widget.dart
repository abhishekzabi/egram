import 'package:egram/config/colors.dart';
import 'package:flutter/material.dart';

class HomePageWidget{
  Widget locationBox(String image, String name,String distance,VoidCallback ontap){
    return    Column(
                              children: [
                                GestureDetector(
                                  onTap: ontap,
                                  child: Container(
                                    height: 140,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Appcolor().reddishcolor,width: 0.5),
                                      borderRadius: BorderRadius.circular(15),image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20,bottom: 4),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(name,style: TextStyle(
                                                            letterSpacing: 0,
                                                            color: Color.fromRGBO(255, 255, 255, 0.867),
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on_sharp,size: 16, color: const Color.fromARGB(255, 253, 37, 37),),
                                                Text(distance,style: TextStyle(
                                                            letterSpacing: 1,
                                                            color: Color.fromRGBO(255, 255, 255, 0.965),
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600)),
                                              ],
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                
                              ],
                            );
  }
  
 

}