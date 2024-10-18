
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egram/config/colors.dart';
import 'package:egram/presentation/pages/offlinestores/teastalladd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TeaStall extends StatefulWidget {
  const TeaStall({super.key});

  @override
  State<TeaStall> createState() => _TeaStallState();
}

class _TeaStallState extends State<TeaStall> {
  final CollectionReference TeaStalldetailcollection =
      FirebaseFirestore.instance.collection('TeaStallDetails');
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 121, 121),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TeaStallAdd()));
          },
          child: const Icon(
            Icons.add,
            color: const Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 300,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/cafepng.png")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      Icon(Icons.people_alt, color: Appcolor().reddishcolor),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("TeaStall/Hotel",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Color.fromRGBO(0, 0, 0, 0.867),
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
                          width: 10,
                        ),
                        Text("5.0  Kakkadavu",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Color.fromRGBO(0, 0, 0, 0.867),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  ///////////////
                ],
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: TeaStalldetailcollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Errror:${snapshot.error}'),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No Data Available !!"),
              );
            }
            var storedetails = snapshot.data!.docs;
            return ListView.builder(
                itemCount: storedetails.length,
                itemBuilder: (context, index) {
                  var storedetail =
                      storedetails[index].data() as Map<String, dynamic>;
                  String storeName = storedetail['StoreName'] ?? 'Unknown Name';
                  String StoreNumber =
                      storedetail['StoreNumber'] ?? 'Unknown number';
                  String StoreDescription =
                      storedetail['StoreDescription'] ?? 'unknown address';
                  String StoreOpen =
                      storedetail['OpeningTime'] ?? 'unknown address';
                  String StoreClose =
                      storedetail['ClosingTime'] ?? 'unknown address';
                  String id = storedetail['id'];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 225, 225, 225),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.store,
                                    color: Appcolor().reddishcolor,
                                    size: 32,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // Show a confirmation dialog before deletion
                                      bool? confirmDelete = await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Delete Confirmation'),
                                          content: Text(
                                              'Are you sure you want to delete this store?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false), // Cancel
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(true), // Confirm
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      );

                                      if (confirmDelete == true) {
                                        // Delete the document from Firestore
                                        await TeaStalldetailcollection.doc(
                                                id) // Use the document ID here
                                            .delete()
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Store deleted successfully"),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        }).catchError((error) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Failed to delete store: $error"),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Appcolor().reddishcolor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Center(
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        StoreNumber,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                    text: StoreNumber))
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      "Mobile Number Copied !!"),
                                                  backgroundColor:
                                                      Colors.blueAccent,
                                                ),
                                              );
                                            });
                                          },
                                          child: Icon(Icons.copy_outlined,
                                              size: 18,
                                              color: Appcolor().reddishcolor))
                                    ],
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          storeName,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    StoreDescription,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            const Text(
                                              "Open",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              StoreOpen,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              "Close",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              StoreClose,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 40,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Appcolor().reddishcolor),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    String _mobilenumber =
                                                        StoreNumber;

                                                    launch(
                                                        'tel:$_mobilenumber');
                                                  },
                                                  icon: const Icon(Icons.call),
                                                  color:
                                                      Appcolor().reddishcolor),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    String _mobilenumber =
                                                        StoreNumber;

                                                    launch(
                                                        'sms:$_mobilenumber');
                                                  },
                                                  icon:
                                                      const Icon(Icons.message),
                                                  color:
                                                      Appcolor().reddishcolor),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
