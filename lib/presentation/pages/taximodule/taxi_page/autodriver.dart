
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/presentation/pages/taximodule/addpage/autorikshaw_addpage.dart';
import 'package:egram/presentation/pages/taximodule/extendedpages/auto_extended.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AutoDriverPage extends StatefulWidget {
  const AutoDriverPage({super.key});

  @override
  State<AutoDriverPage> createState() => _AutoDriverPageState();
}

class _AutoDriverPageState extends State<AutoDriverPage> {
  final CollectionReference autoDetailsCollection =
      FirebaseFirestore.instance.collection('AutoDriverDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 121, 121),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AutoTaxiAddPage()));
          },
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 20,
        automaticallyImplyLeading: false,
        title: const Text(
          "Autorikshaw",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: autoDetailsCollection.snapshots(),
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
          var autoDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: autoDetails.length,
            itemBuilder: (context, index) {
              var autoDetail =
                  autoDetails[index].data() as Map<String, dynamic>;

              String autodriverName =
                  autoDetail['AutoDriverName'] ?? 'Unknown Name';
              String autoDriverNumber =
                  autoDetail['AutoDriverNumber'] ?? 'Unknown number';
              String autodriverAddress =
                  autoDetail['AutoDriverAddress'] ?? 'unknown address';
              String id = autoDetail['id'];

              return Card(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1, bottom: 1),
                child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AutoExtended(
                        drivername: autodriverName, drivernumber: autoDriverNumber, driveraddress: autodriverAddress, id: id)));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/autorikshaw.png"),
                    ),
                    // leading:const Icon(Icons.directions_bus_sharp,color: Colors.teal,),
                    title: Text(
                      autodriverName,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            autodriverAddress,
                            style: const TextStyle(
                                color: Color.fromARGB(194, 60, 60, 60),
                                fontWeight: FontWeight.w400),
                          ),
                         const SizedBox(width: 5,),
                          Text(
                            autoDriverNumber,
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
                                                autoDriverNumber;
        
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
