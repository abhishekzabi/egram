
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/taximodule/taxi_home.dart';
import 'package:flutter/material.dart';

class Parassini extends StatelessWidget {
  const Parassini({super.key});

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
                          image:  DecorationImage(
                              image: AssetImage("assets/images/parassini.jpg"),
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
                           const  SizedBox(
                              width: 10,
                            ),
                            Text("Parassini",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    color: Appcolor().textblack,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                         Padding(
                          padding:const EdgeInsets.only(left: 30),
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
                            
                            const  SizedBox(
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
                                      child: const Icon(Icons.location_on,color:Colors.white)),
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
                          padding:const  EdgeInsets.only(right: 20),
                          child: Divider(color:Appcolor().reddishcolor ,),
                        ),
                         SingleChildScrollView(
                          child: Padding(
                            padding:const  EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Text(
                                    "Parassini Madappura Sree Muthappan temple is a temple located at Parassinikadavu in Anthoor municipality on the banks of the Valapattanam river about 10 km (6.2 mi) from Taliparamba and 20 km (12 mi) from Kannur town in Kannur district, Kerala, India.[2][3] Thiyya community urayima Principal deity of the temple is Sree Muthappan, whose divinity is presented as a ritualistic theyyam enactment in two versions called Thiruvappan and Vellattam. According to the local tradition the presiding deity is a manifestation of Lord Shiva.[4]Vellattam and Thiruvappan are the generic names for two types of ' Theyyam Ketti-aadal ' in the kavu/temples of North Malabar.Vellattom is a minor version of the ritual enactment where the ornaments, decorations and parapharnelia are minimal thanks to which all actions including vaaythari (speech) is maximum and Attam (dance) will be at its peak. If you compare this level of enactment to the idol of a deity in a temple sanctum which is installed as per sathwic sasthra and vedic rituals, Vellattom is at par with the idol alone without the prabha-mandalam which circles it. An easier example is the Seeveli ceremony with only the small idol on top of the elephant.",
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
                                  builder: (context) => const TaxiHome()));
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
