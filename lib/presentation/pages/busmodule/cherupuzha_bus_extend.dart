// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChpBusExtendedDetails extends StatefulWidget {
  String busroute;
  String busname;
  String time;
  String id;
  ChpBusExtendedDetails({
    Key? key,
    required this.busroute,
    required this.busname,
    required this.time,
    required this.id,
  }) : super(key: key);

  @override
  State<ChpBusExtendedDetails> createState() => _ChpBusExtendedDetailsState();
}

class _ChpBusExtendedDetailsState extends State<ChpBusExtendedDetails> {
  final CollectionReference busDetailsCollection =
      FirebaseFirestore.instance.collection('CherupuzhaBusDetails');
  String? _updatedBusRoute;
  String? _updatedBusName;
  String? _updatedbusHour;
  String? _updatedbusMinute;
  final List<String> _busRoutes = [
    'Perumbatta - Moukode',
    'Moukode - Cherupuzha',
    'Bedoor - Kamballur',
    'Elarithattu',
  ];
  final List<String> _busNames = [
    'Private Bus',
    'KSRTC',
  ];

  // Generating a list for hours (0-23) and minutes (0-59)
  final List<String> _hours =
      List.generate(24, (index) => index.toString().padLeft(2, '0'));
  final List<String> _minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));

  // Controller to update bus details
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _routeController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  // Function to get the current formatted date and time
  String getCurrentTime() {
    DateTime now = DateTime.now();

    String formattedTime = DateFormat('hh:mm a').format(now);

    return " $formattedTime ";
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd-MMM-yyyy').format(now);
    return " $formattedDate ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(142, 0, 150, 135)),
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(141, 240, 252, 255),
                      Color.fromARGB(160, 152, 217, 205),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 30,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )),
                        Column(
                          children: [
                            Text(
                              getCurrentTime(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Text(
                              getCurrentDate(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _busNameController.text = widget.busname;
                                _routeController.text = widget.busroute;
                                _timeController.text = widget.time;
                                _showEditDialog(widget.id);
                              },
                              icon: const Icon(Icons.edit),
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            IconButton(
                              onPressed: () {
                                // String documentid=widget.id;
                                // await busDetailsCollection.doc(documentid).delete();
                                _deletebusdata(widget.id);
                              },
                              icon: const Icon(Icons.delete),
                              color: const Color.fromARGB(255, 0, 0, 0),
                            )
                          ],
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        color: Color.fromARGB(255, 139, 137, 137),
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Bus Route : "),
                          Text(
                            widget.busroute,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 14, 14, 14)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Arrival at : "),
                          Text(
                            widget.time,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 14, 14, 14)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Bus Name : "),
                          Text(
                            widget.busname,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 14, 14, 14)),
                          ),
                          const SizedBox(
                            height: 10,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deletebusdata(String documentid) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Do You Really Want To Delete The Data?",
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () async {
                  String documentid = widget.id;
                  await busDetailsCollection.doc(documentid).delete();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Bus details deleted successfully'),
                    backgroundColor: Color.fromARGB(255, 229, 20, 20),
                  ));
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

 
  void _showEditDialog(String documentId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Bus Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Bus Route'),
                value: _updatedBusRoute,
                items: _busRoutes.map((route) {
                  return DropdownMenuItem<String>(
                    value: route,
                    child: Text(route),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _updatedBusRoute = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a bus route' : null,
              ),
              const SizedBox(height: 16),

            
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Bus Name'),
                value: _updatedBusName,
                items: _busNames.map((name) {
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _updatedBusName = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a bus name' : null,
              ),

              const SizedBox(height: 16),

             
              Row(
                children: [
                
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Hour'),
                      value: _updatedbusHour,
                      items: _hours.map((hour) {
                        return DropdownMenuItem<String>(
                          value: hour,
                          child: Text(hour),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _updatedbusHour = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select an hour' : null,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Minute Dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Minute'),
                      value: _updatedbusMinute,
                      items: _minutes.map((minute) {
                        return DropdownMenuItem<String>(
                          value: minute,
                          child: Text(minute),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _updatedbusMinute = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a minute' : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                _updateBusDetails(documentId);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateBusDetails(String documentId) async {
    if (_updatedBusName == null ||
        _updatedBusRoute == null ||
        _updatedbusHour == null ||
        _updatedbusMinute == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields before updating'),
          backgroundColor: Colors.red,
        ),
      );
      return; 
    }

    String updatedfullBusTime = "$_updatedbusHour:$_updatedbusMinute";
    await busDetailsCollection.doc(documentId).update({
      'BusName': _updatedBusName,
      'BusRoute': _updatedBusRoute,
      'time': updatedfullBusTime,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bus details updated successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
