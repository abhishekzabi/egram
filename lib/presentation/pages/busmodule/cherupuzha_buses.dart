
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/busmodule/cherupuzha_bus_add_page.dart';
import 'package:egram/presentation/pages/busmodule/cherupuzha_bus_extend.dart';
import 'package:flutter/material.dart';

class CherupuzhaPage extends StatefulWidget {
  const CherupuzhaPage({super.key});

  @override
  State<CherupuzhaPage> createState() => _CherupuzhaPageState();
}

class _CherupuzhaPageState extends State<CherupuzhaPage> {
  final CollectionReference busDetailsCollection =
      FirebaseFirestore.instance.collection('CherupuzhaBusDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 121, 121),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CherupuzhaBusAdd()));
          },
          child: const Icon(
            Icons.add,
            color:  Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Towards Moukode,Cherupuzha",
                  style: TextStyle(
                    fontSize: 18,
                    color: Appcolor().textblack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
               const  SizedBox(
                  width: 5,
                ),
              ],
            ),
           const SizedBox(
              height: 15,
            ),
            Text(
              "Please Note: Bus timings are subject to change.\n Stay updated and plan accordingly! ",
              style: TextStyle(
                fontSize: 14,
                color: Appcolor().reddishcolor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: busDetailsCollection.snapshots(),
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

              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Card(
                  elevation: 6,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 1, bottom: 1),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChpBusExtendedDetails(
                                busroute: route,
                                busname: busName,
                                time: time,
                                id: id)));
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 246, 255, 255),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChpBusExtendedDetails(busroute: route, busname: busName, time: time, id:id)));
                    //   },
                    //   leading:
                    //   CircleAvatar(
                    //     radius: 25,
                    //     backgroundImage: AssetImage("assets/images/bus2.jpg"),
                    //   ),
                    //   title: Text(
                    //     route,
                    //     style:  TextStyle(
                    //         color: Appcolor().textblack, fontWeight: FontWeight.bold),
                    //   ),
                    //   subtitle: Text(busName, style:  TextStyle(
                    //         color: Appcolor().reddishcolor,)),
                    //   trailing: Text(
                    //     time,
                    //     style:  TextStyle(
                    //         color: Appcolor().reddishcolor,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold),
                    //   ),
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
