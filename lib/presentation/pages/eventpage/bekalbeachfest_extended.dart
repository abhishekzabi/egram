
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/taximodule/taxi_home.dart';
import 'package:flutter/material.dart';

class BekalBeachFestExtended extends StatelessWidget {
  const BekalBeachFestExtended({super.key});

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
                      decoration:const  BoxDecoration(
                         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),
                          image:  DecorationImage(
                              image: AssetImage("assets/images/bekalfest.jpg"),
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
                                        Icons.arrow_back_ios_new_sharp,color: Colors.white,
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
                            Text("Bekal Beach Fest",
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
                                   Text("44 KM",
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
                                   Text("December",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                           color:
                                        Appcolor().textblack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                   Text("Duration",
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
                                    "At Bekal in Kasaragod, Kerala hosts a 10-day international beach festival.The event features flea markets, flower exhibitions, sand sculpture competitions, food festivals, and auto expos. In addition, there will be scheduled activities including helicopter flights and water sports like kayaking, parasailing, canoeing, snorkelling, scuba diving, etc.At the festival, the emphasis is on capturing the essence of the local culture and showcasing the rich artistic diversity of the district. By organising several cultural and musical events and serving up genuine Kasargod food, the festival will highlight the district's potential.",
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
