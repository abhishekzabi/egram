import 'package:egram/service/databese_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';

class AutoTaxiAddPage extends StatefulWidget {
  const AutoTaxiAddPage({super.key});

  @override
  State<AutoTaxiAddPage> createState() => _AutoTaxiAddPage();
}

class _AutoTaxiAddPage extends State<AutoTaxiAddPage> {
  String? selectedAddress;

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final List<String> _addressdata = [
    'Kakkadavu',
    "Chanadukkam",
    "Ariynkallu",
    'perumbatta'
  ];

  final _autoformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/taxi.png"),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Let's Add AutoRikshaw Details!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Please Enter Valid AutoRikshaw Details.",
                style: TextStyle(
                    color: Color.fromARGB(255, 41, 190, 73), fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _autoformKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          labelText: "Driver Name",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 85, 85, 85)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 42, 42, 42)),
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
                    const SizedBox(
                      height: 16,
                    ),
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 85, 85, 85)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 42, 42, 42)),
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

                    const SizedBox(height: 16),

                    // Bus Time Selection

                    const SizedBox(height: 32),
                    Center(
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 46, 193, 153),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            if (_autoformKey.currentState!.validate()) {
                              String id = randomAlphaNumeric(10);

                              Map<String, dynamic> autoDriverInfoMap = {
                                "id": id,
                                "AutoDriverName": _nameController.text,
                                "AutoDriverNumber": _mobileController.text,
                                "AutoDriverAddress": selectedAddress,
                              };

                              await DatabaseMethod()
                                  .autoDriverDetails(autoDriverInfoMap, id);

                              // Show success message
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    'AutoRikshaw Details Added successfully!'),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Add Details',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
