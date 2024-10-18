
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/presentation/pages/taximodule/addpage/tembo_add_page.dart';
import 'package:egram/presentation/pages/taximodule/extendedpages/tembo_extended.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TemboDriverPage extends StatefulWidget {
  const TemboDriverPage({super.key});

  @override
  State<TemboDriverPage> createState() => _TemboDriverPageState();
}

class _TemboDriverPageState extends State<TemboDriverPage> {
  final CollectionReference temboDetailsCollection =
      FirebaseFirestore.instance.collection('TemboDriverDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 121, 121),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TemboAddPage()));
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
          "Tembo/Lorry",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: temboDetailsCollection.snapshots(),
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
          var temboDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: temboDetails.length,
            itemBuilder: (context, index) {
              var temboDetail =
                  temboDetails[index].data() as Map<String, dynamic>;

              String tembodriverName =
                  temboDetail['GoodsDriverName'] ?? 'Unknown Name';
              String temboDriverNumber =
                  temboDetail['GoodsDriverNumber'] ?? 'Unknown number';
              String tembodriverAddress =
                  temboDetail['GoodsDriverAddress'] ?? 'unknown address';
              String id = temboDetail['id'];

              return Card(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1, bottom: 1),
                child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TemboExtended(
                              drivername: tembodriverName,
                              drivernumber: temboDriverNumber,
                              driveraddress: tembodriverAddress,
                              id: id)));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/autorikshaw.png"),
                    ),
                    // leading:const Icon(Icons.directions_bus_sharp,color: Colors.teal,),
                    title: Text(
                      tembodriverName,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            tembodriverAddress,
                            style: const TextStyle(
                                color: Color.fromARGB(194, 60, 60, 60),
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            temboDriverNumber,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 42, 99, 232),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          String _mobilenumber = temboDriverNumber;

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
