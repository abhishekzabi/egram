// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:egram/config/colors.dart';
import 'package:egram/controller/weather_controller.dart';
import 'package:egram/model/weathermodel.dart';
import 'package:egram/presentation/pages/busmodule/bus_home_page.dart';
import 'package:egram/presentation/pages/eventpage/bekalbeachfest_extended.dart';
import 'package:egram/presentation/pages/eventpage/theyyamextended.dart';
import 'package:egram/presentation/pages/location_expanded.dart/bekafort.dart';
import 'package:egram/presentation/pages/location_expanded.dart/kavvayi.dart';
import 'package:egram/presentation/pages/location_expanded.dart/kayyur.dart';
import 'package:egram/presentation/pages/location_expanded.dart/madayippara.dart';
import 'package:egram/presentation/pages/location_expanded.dart/muzhappilangad.dart';
import 'package:egram/presentation/pages/location_expanded.dart/palakkayam.dart';
import 'package:egram/presentation/pages/location_expanded.dart/parrasini.dart';
import 'package:egram/presentation/pages/location_expanded.dart/pulimoottil.dart';
import 'package:egram/presentation/pages/location_expanded.dart/ranipuram.dart';
import 'package:egram/presentation/pages/news/newshome.dart';
import 'package:egram/presentation/pages/offlinestores/groceryshop.dart';
import 'package:egram/presentation/pages/offlinestores/hairsaloon.dart';
import 'package:egram/presentation/pages/offlinestores/hardwarestore.dart';
import 'package:egram/presentation/pages/offlinestores/otherstore.dart';
import 'package:egram/presentation/pages/offlinestores/teastall.dart';
import 'package:egram/presentation/pages/offlinestores/texttile.dart';
import 'package:egram/presentation/pages/taximodule/taxi_home.dart';
import 'package:egram/presentation/widgets/homepage_widget.dart';
import 'package:egram/service/databese_service.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const HomePage({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _feedbackformKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _feedback = '';
  double _rating = 0;
  bool isExpanded = false; // Track whether the text is expanded or not
  late ScrollController _scrollController;
    bool _isFormVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    greetingMessage = getGreetingMessage();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent / 2);
    });
    fetchWeatherData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String greetingMessage = "";

  String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning!";
    } else if (hour < 17) {
      return "Good Afternoon!";
    } else {
      return "Good Evening!";
    }
  }

  Weather? weather;
  bool isLoading = true;
  String errorMessage = '';

  Future<void> fetchWeatherData() async {
    try {
      WeatherService weatherService = WeatherService();
      final fetchedWeather =
          await weatherService.fetchWeather(widget.latitude, widget.longitude);
      setState(() {
        weather = fetchedWeather;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching weather data';
        isLoading = false;
      });
    }
  }

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
      backgroundColor: Appcolor().scaffoldcolorwhite, /////////////////appbar
      appBar: AppBar(
        backgroundColor: Appcolor().scaffoldcolorwhite,
        toolbarHeight: 130,
        title: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey!",
                      style: TextStyle(
                          color: Appcolor().reddishcolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      greetingMessage,
                      style: TextStyle(
                          color: Appcolor().textblack,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Wish You a Happy Day !",
                      style: TextStyle(
                          color: Appcolor().textblack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/images/user.jpg", //////////////////////appbar
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  _offercontainer(
                      "assets/images/taxi.png",
                      "Check Available Taxi!",
                      "Please Note: Bus timings are subject to change. Stay updated and plan accordingly.",
                      "",
                      "Find Taxi", () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TaxiHome()));
                  }),
                  const SizedBox(
                    width: 5,
                  ),
                  _newscontainer(),
                  const SizedBox(
                    width: 4,
                  ),
                  _offercontainer(
                      "assets/images/busservice.png",
                      "Check Bus Timings!",
                      "Please Note: Bus timings are subject to change. Stay updated and plan accordingly.",
                      "",
                      "Find Bus", () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CheemeniBus()));
                  }),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    // border: Border.all(color: Appcolor().reddishcolor),
                    //     gradient: LinearGradient(
                    //       begin: Alignment.bottomLeft,
                    //       end: Alignment.topRight,
                    //       colors: [
                    //  const Color.fromARGB(255, 230, 198, 73),

                    //  const Color.fromARGB(255, 181, 181, 181),
                    //       ],
                    //     ),
                    image: DecorationImage(
                        image: AssetImage("assets/images/bgggg.jpg"),
                        fit: BoxFit.cover)),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : weather != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Row(
                                      children: [
                                        const Icon(Icons.location_on,
                                            color: Colors.white),
                                        Text(
                                          "Kakkadavu",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${weather!.temperature}°C",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(getCurrentTime(),
                                        style: const TextStyle(
                                            letterSpacing: 1,
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    Icon(
                                      weather!.temperature > 0 &&
                                              weather!.temperature <= 20
                                          ? Icons.sunny_snowing
                                          : Icons.wb_cloudy_rounded,
                                      size: 70,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : Center(child: Text(errorMessage)),
              ),
            ),
            const SizedBox(
              height: 1.3,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bggggg.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Center(
                      child: Text('${weather?.description}',
                          style: const TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 234, 234),
                                content: ListTile(
                                  title: Text(
                                    'Cheemeni Police',
                                    style: TextStyle(
                                        color: Appcolor().reddishcolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    '0467 225 0220',
                                    style: TextStyle(
                                        color: Appcolor().primaryone,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  trailing: GestureDetector(
                                      onTap: () {
                                        String _mobilenumber = "04672250220";

                                        launch('tel:$_mobilenumber');
                                      },
                                      child: Icon(
                                        Icons.phone,
                                        size: 26,
                                        color: Appcolor().primaryone,
                                      )),
                                ),
                              );
                            },
                          );
                        },
                        child: _roundedwidget(
                          Icons.local_police_sharp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 234, 234),
                                content: ListTile(
                                  title: Text(
                                    'Fire station Peringome',
                                    style: TextStyle(
                                        color: Appcolor().reddishcolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    '04985 236 100',
                                    style: TextStyle(
                                        color: Appcolor().primaryone,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  trailing: GestureDetector(
                                      onTap: () {
                                        String _firemobilenumber =
                                            "04985 236 100";

                                        launch('tel:$_firemobilenumber');
                                      },
                                      child: Icon(
                                        Icons.phone,
                                        size: 26,
                                        color: Appcolor().primaryone,
                                      )),
                                ),
                              );
                            },
                          );
                        },
                        child: _roundedwidget(
                          Icons.fire_truck_sharp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 234, 234),
                                content: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        'speciality Hospital Cheemeni',
                                        style: TextStyle(
                                            color: Appcolor().reddishcolor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      subtitle: Text(
                                        '080897 70287',
                                        style: TextStyle(
                                            color: Appcolor().primaryone,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      trailing: GestureDetector(
                                          onTap: () {
                                            String _hospitalmobilenumber =
                                                "080897 70287";

                                            launch(
                                                'tel:$_hospitalmobilenumber');
                                          },
                                          child: Icon(
                                            Icons.phone,
                                            size: 26,
                                            color: Appcolor().primaryone,
                                          )),
                                    ),
                                    const Divider(),
                                    ListTile(
                                      title: Text(
                                        'Ambulance  ',
                                        style: TextStyle(
                                            color: Appcolor().reddishcolor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      subtitle: Text(
                                        '108',
                                        style: TextStyle(
                                            color: Appcolor().primaryone,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      trailing: GestureDetector(
                                          onTap: () {
                                            String _ambulancemobilenumber =
                                                "108";

                                            launch(
                                                'tel:$_ambulancemobilenumber');
                                          },
                                          child: Icon(
                                            Icons.phone,
                                            size: 26,
                                            color: Appcolor().primaryone,
                                          )),
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: _roundedwidget(
                          Icons.local_hospital_rounded,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 234, 234),
                                content: ListTile(
                                  title: Text(
                                    'Forest Range Officer Kasaragod',
                                    style: TextStyle(
                                        color: Appcolor().reddishcolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    '0499-4225072',
                                    style: TextStyle(
                                        color: Appcolor().primaryone,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  trailing: GestureDetector(
                                      onTap: () {
                                        String _firesmobilenumber =
                                            " 0499-4225072 ";

                                        launch('tel:$_firesmobilenumber');
                                      },
                                      child: Icon(
                                        Icons.phone,
                                        size: 26,
                                        color: Appcolor().primaryone,
                                      )),
                                ),
                              );
                            },
                          );
                        },
                        child: _roundedwidget(
                          Icons.forest,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Police",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Appcolor().reddishcolor),
                      ),
                      Text(
                        "FireStation",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Appcolor().reddishcolor),
                      ),
                      Text(
                        "Hospital",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Appcolor().reddishcolor),
                      ),
                      Text(
                        "Forest",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Appcolor().reddishcolor),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //////////////////////////
            ///
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 680,
                decoration: BoxDecoration(
                  color: Appcolor().scaffoldcolorwhite,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/kdv3.jpg"),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Appcolor().primaryone,
                                  ),
                                  const Text(
                                    "Kakkadavu",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.people_alt,
                                  color: Appcolor().reddishcolor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Recommended",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        color: Appcolor().textblack,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
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
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text("4.0",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          color: Appcolor().textblack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      DefaultTabController(
                        length: 3,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 300, // Set the height of the container
                                decoration: BoxDecoration(
                                  color: Appcolor()
                                      .scaffoldcolorwhite, // Background color for the container
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                child: Column(
                                  children: <Widget>[
                                    TabBar(
                                      labelColor: Appcolor().reddishcolor,
                                      unselectedLabelColor:
                                          const Color.fromARGB(176, 53, 53, 53),
                                      indicatorColor: Appcolor().reddishcolor,
                                      indicatorWeight: 5,
                                      labelStyle: const TextStyle(
                                          letterSpacing: 1,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.87),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      unselectedLabelStyle: const TextStyle(
                                          letterSpacing: 1,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.87),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      tabs: const [
                                        Tab(text: 'about'),
                                        Tab(text: 'history'),
                                        Tab(text: 'climate'),
                                      ],
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        // Add smooth physics for a better transition between tabs
                                        physics:
                                            const BouncingScrollPhysics(), // Adds smoothness to the tab transitions
                                        children: [
                                          Center(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 18,),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          letterSpacing: 0,
                                                          color: Appcolor()
                                                              .textblack,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        children: const [
                                                          TextSpan(
                                                            text: 'Location: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Kakkadavu is in the Kayyur-Cheemeni Grama Panchayat, under Hosdurg Taluk, in the Kasaragod district.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Nearest railway station: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Cheruvathur on the Mangalore-Palakkad Line.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Nearest airports: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Kannur and Mangalore.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text: 'Economy: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'The economy of Kakkadavu is largely based on plantation and horticulture. The area has the largest area under arecanut in the Region, and also grows coconut, rubber, cashew, and pepper.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Locality Name: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Kakkadavu.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text: 'Village: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Cheemeni.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Block Name: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'Pin: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '671313.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text: 'District: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Kasargod.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text: 'State: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'Kerala.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text: ' Division: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'North Kerala.\n\n',
                                                          ),
                                                          TextSpan(
                                                            text: 'Altitude: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '12M above sea level.\n\n',
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                   const SizedBox(height: 18,),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          letterSpacing: 0,
                                                          color: Appcolor()
                                                              .textblack, // Default text color
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        children: const <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  'Kakkadavu, a notable place in ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                          TextSpan(
                                                              text:
                                                                  'Kasaragod district',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ', has a rich historical backdrop that reflects the region\'s significance over the centuries. The name '),
                                                          TextSpan(
                                                              text: 'Kasaragod',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' itself is derived from the Kannada word "Kasirakood," meaning Nuxvomica forests. Located on India’s west coast, '),
                                                          TextSpan(
                                                              text: 'Kasaragod',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' has long been an important trade center. Throughout history, it attracted many travelers and traders, including Arab merchants between the 9th and 14th centuries, who affectionately referred to the area as '),
                                                          TextSpan(
                                                              text:
                                                                  'Harkwillia',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  '. In 1514, the Portuguese traveler '),
                                                          TextSpan(
                                                              text: 'Barbosa',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' noted the export of rice to Mali Island and the import of coir, highlighting '),
                                                          TextSpan(
                                                              text:
                                                                  'Kasaragod\'s',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' economic importance. The area\'s historical significance is further emphasized by the visit of Dr. '),
                                                          TextSpan(
                                                              text:
                                                                  'Francis Buchanan',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' in 1800, who documented its political and communal structure. '),
                                                          TextSpan(
                                                              text: 'Kakkadavu',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ', as part of this dynamic region, shares in the legacy of the '),
                                                          TextSpan(
                                                              text:
                                                                  'Kumbala kingdom',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ', which encompassed 64 Tulu and Malayalam villages. This historical context sets the stage for understanding the unique identity of '),
                                                          TextSpan(
                                                              text: 'Kakkadavu',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' and its role within the larger narrative of '),
                                                          TextSpan(
                                                              text:
                                                                  'Kasaragod district.',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                   const SizedBox(height: 18,),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          letterSpacing: 0,
                                                          color: Appcolor()
                                                              .textblack, // Default text color
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        children: const <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  'Kasaragod district, where ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                          TextSpan(
                                                              text: 'Kakkadavu',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' is located, lies between 11°-18’ and 12°-48’ northern latitudes and 74°-52’ and 75°-26’ eastern longitudes. The '),
                                                          TextSpan(
                                                              text:
                                                                  'Western Ghats',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' form a natural barrier to the east, creating a mountainous landscape that shapes the district’s topography. The coastline features low cliffs interspersed with sandy stretches, and moving inland, the land rises to low red laterite hills, dotted with paddy fields and coconut gardens, which are characteristic of the area surrounding '),
                                                          TextSpan(
                                                              text:
                                                                  'Kakkadavu.',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' Kasaragod is bordered by the '),
                                                          TextSpan(
                                                              text:
                                                                  'Western Ghats',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' to the east, the '),
                                                          TextSpan(
                                                              text:
                                                                  'Arabian Sea',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' to the west, the '),
                                                          TextSpan(
                                                              text:
                                                                  'Canara district',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' of Karnataka to the north, and the '),
                                                          TextSpan(
                                                              text:
                                                                  'Cannanore district',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' to the south. This diverse geography allows for three natural divisions: the lowlands by the sea, the undulating midlands, and the forested highlands in the east. The climate in '),
                                                          TextSpan(
                                                              text: 'Kasaragod',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' is generally hot, with a mean maximum temperature around 90°F. Humidity is high, reaching about 90% during the southwest monsoon from late May to September. The northeast monsoon begins in October, and the driest months are January and February, making it ideal for agriculture in the '),
                                                          TextSpan(
                                                              text: 'Kakkadavu',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' area, where local farmers cultivate crops such as rice and coconut. '),
                                                          TextSpan(
                                                              text:
                                                                  'Kasaragod district',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' has 8,602 hectares of forest under the '),
                                                          TextSpan(
                                                              text:
                                                                  'Wynad Forest Division',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ', which includes the ranges of Kasaragod and Kanhangad. These forests produce valuable resources like shea bark, cardamom, and canes. Wildlife such as '),
                                                          TextSpan(
                                                              text:
                                                                  'sambar deer',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text:
                                                                  ' can be found in the area, while wild pigs can sometimes be a nuisance for farmers in the hilly regions near '),
                                                          TextSpan(
                                                              text:
                                                                  'Kakkadavu.',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ///////////////////////////
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people_alt, color: Appcolor().reddishcolor),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Visit Store",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Appcolor().textblack,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
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
                        const SizedBox(
                          width: 4,
                        ),
                        Text("4.0",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Appcolor().textblack,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _storeBox("assets/images/grocerypng.png", "Grocery Stores",
                        'Kakkadavu', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const GroceryStore()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    _storeBox("assets/images/hardwarepng.png", "Hardware Store",
                        'Kakkadavu', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HardwareStore()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    _storeBox(
                        "assets/images/cafepng.png", "TeaStall", 'Kakkadavu',
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TeaStall()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    _storeBox("assets/images/taylorpng.png",
                        "textiles/tayloring", 'Kakkadavu', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Textile()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _storeBox("assets/images/barberpng.png", "Hair Saloons",
                        'Kakkadavu', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HairSaloon()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    _storeBox("assets/images/other.png", "Others", 'Kakkadavu',
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OtherStore()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),

            ////////////////////////

            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.people_alt,
                        color: Appcolor().reddishcolor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Popular Locations",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Appcolor().textblack,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Text("5.0",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Appcolor().textblack,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomePageWidget().locationBox(
                        "assets/images/bekal.jpg", "Bekal Fort", '44 KM', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BekalFort()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox(
                        "assets/images/ranipuram.jpg", "Ranipuram", '44 KM',
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Ranipuram()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox(
                        "assets/images/kav.jpg", "Kavvayi BackWater", '33 KM',
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kavvayi()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox("assets/images/palakkayam.jpg",
                        "Palakkayam Thattu", '40 KM', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Palakkayam()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox(
                        "assets/images/madayippara.jpg", " MadayiPara", '33 KM',
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Madayippara()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox("assets/images/muzhu.jpg",
                        " Muzhuppilangad Beach", '71 KM', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Muzhappilangad()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox("assets/images/parassini.jpg",
                        "Parassinikkadavu", '44 KM', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Parassini()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox(
                        "assets/images/kayyur.png", "Kayyur kayaking", '20 KM',
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kayyur()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox("assets/images/pulimotil.jpg",
                        "Pulimoot Beach", '26 KM', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Pulimoot()));
                    })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            /////////////////////////////////////////////////////////////////////
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people_alt, color: Appcolor().reddishcolor),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Popular Events",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Appcolor().textblack,
                              fontSize: 18,
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
                        const SizedBox(
                          width: 4,
                        ),
                        Text("5.0",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Appcolor().textblack,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomePageWidget().locationBox(
                        "assets/images/theyyams.jpg", "Theyyam", 'oct-june',
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TeyyamExtended()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    HomePageWidget().locationBox("assets/images/bekalfest.jpg",
                        "Bekal Beach Fest", 'Dec', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const BekalBeachFestExtended()));
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
       
            ////////////////////////
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15)
,              child: Container(
              
                child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
              // Heading with toggle button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               
                  Container(
                    child: Row(
                      children: [
                           Icon(Icons.feedback,color: Appcolor().reddishcolor,),
                           const SizedBox(width: 8,),
                        Text(
                          'Feedback',
                         style: TextStyle(
                                      letterSpacing: 1,
                                      color: Appcolor().textblack,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isFormVisible
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 38,
                      color: Appcolor().reddishcolor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFormVisible = !_isFormVisible;
                      });
                    },
                  ),
                ],
              ),
            const  SizedBox(height: 16),
              
              // Feedback Form (Visible/Invisible based on _isFormVisible)
              Visibility(
                visible: _isFormVisible,
                child: Form(
                  key: _feedbackformKey,
                  child: Column(
                    children: <Widget>[
                      // Name Input
                      Container(
                        decoration: BoxDecoration(
                          color: Appcolor().scaffoldcolorwhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Appcolor().scaffoldcolorwhite),
                             borderRadius: BorderRadius.circular(10),
                          ),
                           focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:Appcolor().scaffoldcolorwhite), // Focused border color
                            borderRadius: BorderRadius.circular(10),
                          ),
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person,color: Appcolor().reddishcolor,),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _name = value ?? '';
                          },
                        ),
                      ),
                      SizedBox(height: 16),
              
                      // Email Input
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Appcolor().scaffoldcolorwhite),
                             borderRadius: BorderRadius.circular(10),
                          ),
                           focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:Appcolor().scaffoldcolorwhite), // Focused border color
                            borderRadius: BorderRadius.circular(10),
                          ),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email,color: Appcolor().reddishcolor,),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value ?? '';
                          },
                        ),
                      ),
                      SizedBox(height: 16),
              
                      // Feedback Input
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Appcolor().scaffoldcolorwhite),
                             borderRadius: BorderRadius.circular(10),
                          ),
                           focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:Appcolor().scaffoldcolorwhite), // Focused border color
                            borderRadius: BorderRadius.circular(10),
                          ),
                            labelText: 'Feedback',
                            prefixIcon: Icon(Icons.feedback,color: Appcolor().reddishcolor,),
                          ),
                          maxLines: 4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide your feedback';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _feedback = value ?? '';
                          },
                        ),
                      ),
                      SizedBox(height: 16),
              
                      // Rating Slider
                      Text(
                        'Rate your experience:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: _rating,
                        onChanged: (newRating) {
                          setState(() {
                            _rating = newRating;
                          });
                        },
                        divisions: 5,
                        label: '$_rating',
                        min: 0,
                        max: 5,
                        activeColor: Appcolor().reddishcolor,
                        inactiveColor: Colors.blueGrey[100],
                      ),
                      SizedBox(height: 24),
              
                      // Submit Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolor().reddishcolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () async {
                          if (_feedbackformKey.currentState!.validate()) {
                              String id = randomAlphaNumeric(10);
                               Map<String, dynamic> feedbackInfoMap = {
                                "id": id,
                                "UserName": _name,
                                "UserMail": _email,
                                "FeedbackDesc": _feedback,
                                 "Rating": _rating,
                                 
                                  
                              };
                              
                              await DatabaseMethod().feedbackDetails(feedbackInfoMap, id);
                           
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text('Feedback Submitted'),
                                  content: Text('Thank you for your feedback!'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      
                                    
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK',style: TextStyle(color: Appcolor().reddishcolor),),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Padding(
                          padding:  EdgeInsets.only(left: 30,right: 30),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
                        ],
                      ),
              ),
            )

      
          ],
        ),
      ),
    );
  }

  Widget _offercontainer(String imagepath, String heading, String subheading,
      String subheading2, String buttonname, VoidCallback ontapevent) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Appcolor().primaryone
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Appcolor().primaryone,
                const Color.fromARGB(255, 155, 245, 199),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 26, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Appcolor().textprimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 6,
                ),
                Text(subheading,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Appcolor().textprimary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
                Text(subheading2,
                    style: const TextStyle(
                        color: Color.fromRGBO(48, 192, 228, 0.929),
                        fontSize: 10,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: ontapevent,
                  child: Text(buttonname,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor().reddishcolor,
                      surfaceTintColor: Appcolor().scaffoldcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 140,
          child: Container(
              height: 170,
              width: 190,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage(imagepath), fit: BoxFit.fill))),
        )
      ],
    );
  }

  Widget _roundedwidget(
    IconData icon,
  ) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        // color: color,
        image: DecorationImage(
            image: AssetImage("assets/images/bgggg.jpg"), fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(icon,
            size: 30, color: const Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }

  Widget _detailedmobile() {
    return Container(
      height: 400,
      width: 250,
      decoration: BoxDecoration(
        color: const Color.fromARGB(218, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35, top: 10),
                child: Container(
                  height: 25,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: const Center(child: Text("32% off")),
                ),
              ),
            ],
          ),
          Container(
            height: 220,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/mobile1.png"))),
          ),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(" ₹ 10999",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Color.fromRGBO(11, 11, 11, 0.835),
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("VIVO V_15_PRO(IRON,64 GB)",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Appcolor().reddishcolor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _newscontainer() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Appcolor().primaryone
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Appcolor().primaryone,
                const Color.fromARGB(255, 155, 245, 199),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 26, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Latest Article With Better News",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Appcolor().textprimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 6,
                ),
                Text(
                    "Browse the latest news on latest strategies,trends various tools and news in the world",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Appcolor().textprimary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
                // Text(subheading2,
                //     style: const TextStyle(
                //         color: Color.fromRGBO(48, 192, 228, 0.929),
                //         fontSize: 10,
                //         letterSpacing: 1,
                //         fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsFeedPage()));
                  },
                  child: Text("Get Started",
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor().scaffoldcolor,
                      surfaceTintColor: Appcolor().scaffoldcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 160,
          child: Container(
              height: 120,
              width: 150,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/images/news.png"),
                      fit: BoxFit.fill))),
        )
      ],
    );
  }

  Widget _storeBox(
      String image, String name, String distance, VoidCallback ontap) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Appcolor().reddishcolor, width: 0.5),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Appcolor().reddishcolor, width: 0.5),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(name,
                        style: TextStyle(
                            letterSpacing: 0,
                            color: Appcolor().textblack,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    Text(distance,
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Appcolor().textblack,
                            fontSize: 10,
                            fontWeight: FontWeight.w400)),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
