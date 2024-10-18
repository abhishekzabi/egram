
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/presentation/pages/taximodule/addpage/magic_add_page.dart';
import 'package:egram/presentation/pages/taximodule/extendedpages/magic_extended.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MagicDriver extends StatefulWidget {
  const MagicDriver({super.key});

  @override
  State<MagicDriver> createState() => _MagicDriverState();
}

class _MagicDriverState extends State<MagicDriver> {
  final CollectionReference MagicDetailsCollection =
      FirebaseFirestore.instance.collection('MagicirisDriverDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 121, 121),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MagicAddPage()));
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
          "Magic Iris",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: MagicDetailsCollection.snapshots(),
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
          var magicDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: magicDetails.length,
            itemBuilder: (context, index) {
              var magicDetail =
                  magicDetails[index].data() as Map<String, dynamic>;

              String magicdriverName =
                  magicDetail['AutoDriverName'] ?? 'Unknown Name';
              String magicDriverNumber =
                  magicDetail['AutoDriverNumber'] ?? 'Unknown number';
              String magicdriverAddress =
                  magicDetail['AutoDriverAddress'] ?? 'unknown address';
              String id = magicDetail['id'];

              return Card(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1, bottom: 1),
                child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MagicExtended(
                              drivername: magicdriverName,
                              drivernumber: magicDriverNumber,
                              driveraddress: magicdriverAddress,
                              id: id)));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/magic2.png"),
                    ),
                    // leading:const Icon(Icons.directions_bus_sharp,color: Colors.teal,),
                    title: Text(
                      magicdriverName,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            magicdriverAddress,
                            style: const TextStyle(
                                color: Color.fromARGB(194, 60, 60, 60),
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            magicDriverNumber,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 42, 99, 232),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          String _mobilenumber = magicDriverNumber;

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
