
import 'package:egram/service/databese_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';

class GroceryAdd extends StatefulWidget {
  const GroceryAdd({super.key});

  @override
  State<GroceryAdd> createState() => _GroceryAdd();
}

class _GroceryAdd extends State<GroceryAdd> {
// TextEditingControllers to capture input values
  TextEditingController storeNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();
   //////////////////


  
  final _storeformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grocerypng.png"),
                  ),
                ),
              ),
            ),
             Padding(
              padding:const  EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);

                  }, icon:const Icon(Icons.arrow_back_ios_new)),
                const  Text(
                    "Let's Add Store Details!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Please Enter Valid Store Details.",
                style: TextStyle(color: Color.fromARGB(255, 41, 190, 73), fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _storeformKey,
                child: Column(
                  children: [
                      TextFormField(
                        controller: storeNameController,
                decoration:const  InputDecoration(
                  labelText: "Store Name",
                  border: UnderlineInputBorder(), // Line border
                ),
                
            
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter store name';
                  }
                  return null;
                },
              ),

                
                  const   SizedBox(height: 16),

                    // Bus Name Dropdown
                      // Contact Number
              TextFormField(
                controller: contactNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                ],
                decoration:const  InputDecoration(
                  labelText: "Contact Number",
                  border: UnderlineInputBorder(), // Line border
                ),
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'Enter a valid 10-digit number';
                  }
                  return null;
                },
              ),

                  const   SizedBox(height: 16),
                    TextFormField(
                      maxLength: 60,
                      controller: descriptionController,
                decoration:const  InputDecoration(
                  labelText: "Description",
                  border: UnderlineInputBorder(), // Line border
                ),
                maxLines: 3, // Multi-line description
              ),
             const  SizedBox(height: 16),

              // Opening Time
              TextFormField(
                controller: openingTimeController,
                decoration:  const InputDecoration(
                  labelText: "Opening Time",
                  border: UnderlineInputBorder(), // Line border
                  hintText: "e.g., 09:00 AM",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter opening time';
                  }
                  return null;
                },
              ),
                SizedBox(height: 16),

              // Closing Time
              TextFormField(
                controller: closingTimeController,
                decoration:const  InputDecoration(
                  labelText: "Closing Time",
                  border: UnderlineInputBorder(), // Line border
                  hintText: "e.g., 09:00 PM",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter closing time';
                  }
                  return null;
                },
              ),

                   
                   
                   const  SizedBox(height: 32),
                    Center(
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 46, 193, 153),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            if (_storeformKey.currentState!.validate()) {
                              String id = randomAlphaNumeric(10);
                             

                              Map<String, dynamic> storeInfoMap = {
                                "id": id,
                                "StoreName": storeNameController.text,
                                "StoreNumber": contactNumberController.text,
                                "StoreDescription": descriptionController.text,
                                 "OpeningTime": openingTimeController.text,
                                  "ClosingTime": closingTimeController.text,
                                  
                              };
                              
                              await DatabaseMethod().storeDetails(storeInfoMap, id);

                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Store Details Added successfully!'),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Add Store',
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
