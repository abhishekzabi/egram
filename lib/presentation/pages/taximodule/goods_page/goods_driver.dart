
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/presentation/pages/taximodule/addpage/goods_add_page.dart';
import 'package:egram/presentation/pages/taximodule/extendedpages/goods_extended.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoodsDriverPage extends StatefulWidget {
  const GoodsDriverPage({super.key});

  @override
  State<GoodsDriverPage> createState() => _GoodsDriverPageState();
}

class _GoodsDriverPageState extends State<GoodsDriverPage> {
  final CollectionReference goodsDetailsCollection =
      FirebaseFirestore.instance.collection('GoodsDriverDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 121, 121),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const GoodsAddPage()));
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
          "Goods/Pickup",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: goodsDetailsCollection.snapshots(),
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
          var goodsDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: goodsDetails.length,
            itemBuilder: (context, index) {
              var goodsDetail =
                  goodsDetails[index].data() as Map<String, dynamic>;

              String goodsdriverName =
                  goodsDetail['GoodsDriverName'] ?? 'Unknown Name';
              String goodsDriverNumber =
                  goodsDetail['GoodsDriverNumber'] ?? 'Unknown number';
              String goodsdriverAddress =
                  goodsDetail['GoodsDriverAddress'] ?? 'unknown address';
              String id = goodsDetail['id'];

              return Card(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 1, bottom: 1),
                child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GoodsExtended(
                        drivername: goodsdriverName, drivernumber: goodsDriverNumber, driveraddress: goodsdriverAddress, id: id)));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/autorikshaw.png"),
                    ),
                    // leading:const Icon(Icons.directions_bus_sharp,color: Colors.teal,),
                    title: Text(
                      goodsdriverName,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            goodsdriverAddress,
                            style: const TextStyle(
                                color: Color.fromARGB(194, 60, 60, 60),
                                fontWeight: FontWeight.w400),
                          ),
                         const SizedBox(width: 5,),
                          Text(
                            goodsDriverNumber,
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
                                                goodsDriverNumber;
        
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
