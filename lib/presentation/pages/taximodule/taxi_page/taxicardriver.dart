
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/presentation/pages/taximodule/addpage/taxicar_addpage.dart';
import 'package:egram/presentation/pages/taximodule/extendedpages/taxicar_extended.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TaxiCarDriver extends StatefulWidget {
  const TaxiCarDriver({super.key});

  @override
  State<TaxiCarDriver> createState() => _TaxiCarDriverState();
}

class _TaxiCarDriverState extends State<TaxiCarDriver> {
   final CollectionReference taxicarDetailsCollection =
      FirebaseFirestore.instance.collection('TaxiCarDriverDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 121, 121),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const TaxiCarAddPage()));
          },
          child: const Icon(
            Icons.add,
            color: const Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
        ),
      ),
    appBar: AppBar(
        toolbarHeight: 20,
        automaticallyImplyLeading: false,
        title: const Text(
          "Taxi Car",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: taxicarDetailsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No details available.'));
          }

          // Fetch documents from Firestore
          var taxicarDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: taxicarDetails.length,
            itemBuilder: (context, index) {
              var taxicarDetail =
                  taxicarDetails[index].data() as Map<String, dynamic>;

              String taxicardriverName =
                  taxicarDetail['AutoDriverName'] ?? 'Unknown Name';
              String taxicarDriverNumber =
                  taxicarDetail['AutoDriverNumber'] ?? 'Unknown number';
              String taxicardriverAddress =
                  taxicarDetail['AutoDriverAddress'] ?? 'unknown address';
              String id = taxicarDetail['id'];

              return Card(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1, bottom: 1),
                child: ListTile(
                    onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TaxiCarExtended(
                      drivername: taxicardriverName, drivernumber: taxicarDriverNumber, driveraddress: taxicardriverAddress, id: id)));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/taxicar.png"),
                    ),
                    // leading:const Icon(Icons.directions_bus_sharp,color: Colors.teal,),
                    title: Text(
                      taxicardriverName,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                     subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                       
                        children: [
                          Text(
                            taxicardriverAddress,
                            style: const TextStyle(
                                color: Color.fromARGB(194, 60, 60, 60),
                                fontWeight: FontWeight.w400),
                          ),
                         const SizedBox(width: 5,),
                          Text(
                            taxicarDriverNumber,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 42, 99, 232),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                           String _mobilenumber =
                                              taxicarDriverNumber;
        
                                            launch('tel:$_mobilenumber');
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                          size: 30,
                        ))),
              );
            },
          );
        },
      ),
    );
  }
}