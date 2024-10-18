
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/taximodule/taxi_home.dart';
import 'package:flutter/material.dart';

class Kavvayi extends StatelessWidget {
  const Kavvayi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Appcolor().scaffoldcolorwhite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      height: 400,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/kav.jpg"),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios_new_sharp,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Row(
                          children: [
                            Icon(
                              Icons.people_alt,
                              color:Appcolor().reddishcolor
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Kavvayi BackWaters",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    color: Appcolor().textblack,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                         Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Appcolor().reddishcolor,
                                size: 16,
                              ),
                               Icon(
                                Icons.star_rate_rounded,
                                color: Appcolor().reddishcolor,
                                size: 16,
                              ),
                               Icon(
                                Icons.star_rate_rounded,
                                color: Appcolor().reddishcolor,
                                size: 16,
                              ),
                               Icon(
                                Icons.star_rate_rounded,
                                color: Appcolor().reddishcolor,
                                size: 16,
                              ),
                               Icon(
                                Icons.star_rate_rounded,
                                color: Appcolor().reddishcolor,
                                size: 16,
                              ),
                            
                              SizedBox(
                                width: 4,
                              ),
                              Text("5.0",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color:
                                        Appcolor().textblack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Appcolor().reddishcolor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Icon(Icons.location_on,color:Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text("33 KM",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                             color:
                                        Appcolor().textblack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                   Text("Distance",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                             color:
                                        Appcolor().textblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color:Appcolor().reddishcolor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child:const  Icon(Icons.sunny_snowing,color:Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text("30\u00B0C",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                           color:
                                        Appcolor().textblack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                   Text("Temperature",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                            color:
                                        Appcolor().textblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color:Appcolor().reddishcolor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Icon(Icons.star,color:Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text("4K+",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                            color:
                                        Appcolor().textblack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                   Text("Riviews",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                            color:
                                        Appcolor().textblack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300))
                                ],
                              )
                            ],
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Divider(color:Appcolor().reddishcolor ,),
                        ),
                         SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Text(
                                    "The Kavvayi Backwaters, located near Payyannur, are the third largest backwaters in Kerala and the largest one in north Kerala. Locally called as Kavvayi Kayal or the backwaters of Kavvayi, this lesser known lake of northern Kerala is fed by the River Kavvayi and its tributary streams: Kankol, Vannathichal, Kuppithodu, and Kuniyan.[1] The Kavvayi Backwaters are named after the Kavvayi Islands close to Payyannur. Kavvayi used to be an inland port and a major administrative center during the past centuries and during British East India Company rule.The northern portion of Kavvayi Lake is also known as Valiyaparamba backwaters. This island has a population of 10,000. The island's main source of income come from agriculture and fishing. A secluded beach named Valiparamba beach runs parallel to the backwaters on its western side.Ecologically, the backwater of Kavvayi and its surrounding region is considered to be of significance. The Kavvayi backwater is the biggest wetland ecosystem in north Kerala with an area of 37 km2. The backwater and the wetlands are home to a variety of fauna and flora.",
                                    style: TextStyle(
                                        letterSpacing: 0,
                                        color:
                                              
                                        Appcolor().textblack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor:
                                  Appcolor().reddishcolor
                                    ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TaxiHome()));
                            },
                            child: const Text("Book Journey",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
