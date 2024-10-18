// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class TemboExtended extends StatefulWidget {
  String drivername;
  String drivernumber;
  String driveraddress;
  String id;

  TemboExtended({
    Key? key,
    required this.drivername,
    required this.drivernumber,
    required this.driveraddress,
    required this.id,
  }) : super(key: key);

  @override
  State<TemboExtended> createState() => _TemboExtendedState();
}

class _TemboExtendedState extends State<TemboExtended> {
  final CollectionReference temboDetailsCollection =
      FirebaseFirestore.instance.collection('TemboDriverDetails');
  String? selectedAddress;

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final List<String> _addressdata = [
    'Kakkadavu',
    "Chanadukkam",
    "Ariynkallu",
    'perumbatta'
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(141, 113, 226, 255),
                        Color.fromARGB(192, 135, 240, 210),
                      ],
                    ),
                    border: Border.all(
                        width: 1, color: const Color.fromARGB(142, 0, 150, 135)),
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/taxiextended.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                height: 350,
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
                                  _nameController.text = widget.drivername;
                                  _mobileController.text = widget.drivernumber;
                                  selectedAddress = widget.driveraddress;
                                  _showEditDialog(widget.id);
                                },
                                icon: const Icon(Icons.edit),
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              IconButton(
                                onPressed: () {
                                  // String documentid=widget.id;
                                  // await busDetailsCollection.doc(documentid).delete();
                                  _deleteautodata(widget.id);
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Driver Name : "),
                                Text(
                                  widget.drivername,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 14, 14, 14)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Mobile Number "),
                                Row(
                                  children: [
                                    Text(
                                      widget.drivernumber,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 14, 14, 14)),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                                  text: widget.drivernumber))
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
                                        child: const Icon(
                                          Icons.copy_outlined,
                                          color: Color.fromARGB(255, 32, 89, 188),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Driver Address"),
                                Text(
                                  widget.driveraddress,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 14, 14, 14)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 20, top: 0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(20),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/user.jpg"))),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            String _mobilenumber =
                                                widget.drivernumber;
        
                                            launch('tel:$_mobilenumber');
                                          },
                                          icon: const Icon(Icons.call),
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            String _mobilenumber =
                                                widget.drivernumber;
        
                                            launch('sms:$_mobilenumber');
                                          },
                                          icon: const Icon(Icons.message),
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Text(
                            "Driver and Vehicle details may change. Please check for updates before your Service. ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 255, 51, 51),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteautodata(String documentid) {
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
                  await temboDetailsCollection.doc(documentid).delete();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Tembo details deleted successfully'),
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
          title: const Text("Edit Lorry Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Driver Name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 85, 85, 85)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 42, 42, 42)),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter DriverName';
                  } else if (value.length < 4) {
                    return 'enter correct name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',

                  // Remove the box border, only show a line
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 85, 85, 85)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 42, 42, 42)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  } else if (value.length != 10) {
                    return 'Mobile number must be 10 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Address'),
                value: selectedAddress,
                items: _addressdata.map((name) {
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a Address' : null,
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
                _updatetemboDetails(documentId);
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

  Future<void> _updatetemboDetails(String documentId) async {
    if (_nameController == null ||
        _mobileController == null ||
        selectedAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields before updating'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await temboDetailsCollection.doc(documentId).update({
      'GoodsDriverName': _nameController.text,
      'GoodsDriverNumber': _mobileController.text,
      'GoodsDriverAddress': selectedAddress,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(' details updated successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
