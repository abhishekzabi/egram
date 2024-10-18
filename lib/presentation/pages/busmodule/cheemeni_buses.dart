
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/busmodule/cheemeni_bus_add_page.dart';
import 'package:egram/presentation/pages/busmodule/cheemeni_bus_extended_details.dart';
import 'package:flutter/material.dart';

class CheemeniPage extends StatefulWidget {
  const CheemeniPage({super.key});

  @override
  State<CheemeniPage> createState() => _CheemeniPageState();
}

class _CheemeniPageState extends State<CheemeniPage> {
  final CollectionReference busDetailsCollection =
      FirebaseFirestore.instance.collection('CheemeniBusDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor().scaffoldcolorwhite,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: Appcolor().reddishcolor,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CheemeniBusAdd()));
          },
          child: const Icon(
            Icons.add,
            color: const Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Appcolor().scaffoldcolorwhite,
        toolbarHeight: 130,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Towards Cheemeni,Payyanur",
                  style: TextStyle(
                    fontSize: 18,
                    color: Appcolor().textblack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Please Note: Bus timings are subject to change.\n Stay updated and plan accordingly! ",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 51, 51),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: busDetailsCollection.orderBy('time').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No bus details available.'));
          }

          // Fetch documents from Firestore
          var busDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: busDetails.length,
            itemBuilder: (context, index) {
              var busDetail = busDetails[index].data() as Map<String, dynamic>;

              // Assuming each document has fields 'busName' and 'route'
              String busName = busDetail['BusName'] ?? 'Unknown Bus';
              String route = busDetail['BusRoute'] ?? 'Unknown Route';
              String time = busDetail['time'] ?? 'unknowntime';
              String id = busDetail['id'];
              // String mode=busDetail['mode']??'unknowntime';

              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Card(
                    elevation: 6,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 1, bottom: 1),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheemeniBusExtendedDetails(
                                  busname: busName,
                                  busroute: route,
                                  time: time,
                                  id: id,
                                )));
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(14),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromARGB(255, 245, 225, 225),
                              Color.fromARGB(255, 254, 251, 251),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.bus_alert_outlined,
                                    color: Appcolor().reddishcolor,
                                  ),
                                  Icon(
                                    Icons.timer,
                                    color: Appcolor().reddishcolor,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  Text(route,
                                      style: TextStyle(
                                          color: Appcolor().textblack,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Appcolor().reddishcolor)),
                                    child: Center(
                                        child: Text(
                                      busName,
                                      style: TextStyle(
                                          color: Appcolor().reddishcolor),
                                    )),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Appcolor().reddishcolor)),
                                    child: Center(
                                        child: Text(
                                      time,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Appcolor().reddishcolor),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_purple500_rounded,
                                    color: Appcolor().reddishcolor,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border_purple500_rounded,
                                    color: Appcolor().reddishcolor,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border_purple500_rounded,
                                    color: Appcolor().reddishcolor,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border_purple500_rounded,
                                    color: Appcolor().reddishcolor,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border_purple500_rounded,
                                    color: Appcolor().reddishcolor,
                                    size: 18,
                                  ),
                                  const Text("5.0")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    //  ListTile(
                    //   onTap: (){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CheemeniBusExtendedDetails(
                    //       busname: busName,busroute: route,time: time,id: id,
                    //     )));
                    //   },
                    //   leading:const  CircleAvatar(
                    //     radius: 25,
                    //     backgroundImage: AssetImage("assets/images/bus2.jpg"),
                    //   ),
                    //   // leading:const Icon(Icons.directions_bus_sharp,color: Colors.teal,),
                    //   title: Text(route,style:  TextStyle(color: Appcolor().textblack,fontWeight: FontWeight.bold),),
                    //   subtitle: Text(busName,style: TextStyle(color: Appcolor().reddishcolor),),
                    //   trailing:Text(time,style: TextStyle(color:Appcolor().reddishcolor,fontSize: 16, fontWeight: FontWeight.bold) ,)

                    //   //  Text(time,style: TextStyle(color: Colors.teal,fontSize: 16, fontWeight: FontWeight.bold)),
                    // ),
                    ),
              );
            },
          );
        },
      ),
    );
  }
}
