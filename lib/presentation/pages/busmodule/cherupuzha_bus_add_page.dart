
import 'package:egram/service/databese_service.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CherupuzhaBusAdd extends StatefulWidget {
  const CherupuzhaBusAdd({super.key});

  @override
  State<CherupuzhaBusAdd> createState() => _CherupuzhaBusAdd();
}

class _CherupuzhaBusAdd extends State<CherupuzhaBusAdd> {
  String? chpselectedBusRoute;
  String? chpselectedBusName;
  String? busHour;
  String? busMinute;

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

  final List<String> _hours =
      List.generate(24, (index) => index.toString().padLeft(2, '0'));
  final List<String> _minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));
  final _formKey = GlobalKey<FormState>();
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
                        image: AssetImage("assets/images/busservice.png"))),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Add Bus Details!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Please Enter Valid Bus Details.",
                    style: TextStyle(
                        color: Color.fromARGB(255, 41, 190, 73), fontSize: 12),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Bus Route Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Bus Route'),
                      value: chpselectedBusRoute,
                      items: _busRoutes.map((route) {
                        return DropdownMenuItem<String>(
                          value: route,
                          child: Text(route),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          chpselectedBusRoute = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a bus route' : null,
                    ),

                    const SizedBox(height: 16),

                    // Bus Name Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Bus Name'),
                      value: chpselectedBusName,
                      items: _busNames.map((name) {
                        return DropdownMenuItem<String>(
                          value: name,
                          child: Text(name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          chpselectedBusName = value;
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
                            decoration:
                                const InputDecoration(labelText: 'Hour'),
                            value: busHour,
                            items: _hours.map((hour) {
                              return DropdownMenuItem<String>(
                                value: hour,
                                child: Text(hour),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                busHour = value;
                              });
                            },
                            validator: (value) =>
                                value == null ? 'Please select an hour' : null,
                          ),
                        ),

                        const SizedBox(width: 16),

                        // AM/PM Dropdown
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Minute'),
                            value: busMinute,
                            items: _minutes.map((minute) {
                              return DropdownMenuItem<String>(
                                value: minute,
                                child: Text(minute),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                busMinute = value;
                              });
                            },
                            validator: (value) =>
                                value == null ? 'Please select a minute' : null,
                          ),
                        ),
                      ],
                    ),

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
                            String id = randomAlphaNumeric(10);
                            String fullBusTime =
                                "$busHour:$busMinute"; // Combine hour and minute
                            Map<String, dynamic> chpbusInfoMap = {
                              "id": id,
                              "BusRoute": chpselectedBusRoute,
                              "BusName": chpselectedBusName,
                              "time": fullBusTime
                            };
                            await DatabaseMethod()
                                .cherupuzhaAddBusDetails(chpbusInfoMap, id);
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text('Bus Details Added successfully!'),
                                backgroundColor: Colors.green,
                              ));
                            }
                          },
                          child: const Text(
                            'Add Bus',
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
