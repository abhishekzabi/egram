
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/taximodule/taxi_home.dart';
import 'package:flutter/material.dart';

class TeyyamExtended extends StatelessWidget {
  const TeyyamExtended({super.key});

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
                              image: AssetImage("assets/images/theyyams.jpg"),
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
                            Text("Teyyam",
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
                                   Text("4 KM",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                             color:
                                        Appcolor().textblack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                   Text("Nearest",
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
                                   Text("oct-june",
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
                                    "Theyyam is a religious ritual practiced mainly in northern Kerala and parts of Karnataka. It's also called Kaḷiyāṭṭaṁ or Tiṟa. Theyyam includes traditions and customs connected to temples and sacred groves in the Malabar region. People believe that the Theyyam performer acts as a medium for a god, and they seek blessings through the performance.In Kerala, Theyyam is mostly performed in the North Malabar area, including places like Kasargod, Kannur, and parts of Wayanad and Kozhikode. A similar ritual called Bhuta Kola is practiced in the Tulunadu region of Karnataka.The Theyyam season begins around October, during the tenth day of the Malayalam month of Thulam, and lasts for about seven months until May or June. The final Theyyam performances take place at Madayi Kavu and Kalarivathukkal Bhagavathy Temple, which are important shrines for the Kolathiri royal family.",
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
