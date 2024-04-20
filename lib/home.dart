
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/loading.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;

    // Use null-aware operators to safely access values and provide defaults
    // String tempValue = (info!['tempvalue'].toString()).substring(0, 4);
    // String tempValue =
    //     (info?['tempvalue']?.toString() ?? 'N/A').substring(0, 4);
    String tempValue = (info?['tempvalue']?.toString() ?? 'N/A').length >= 4
    ? (info?['tempvalue']?.toString() ?? 'N/A').substring(0, 5)
    : 'N/A';

    String humidityValue = info?['humidityy'] ?? 'N/A';
    String descriptionValue = info?['description'] ?? 'N/A';
    // String weatherMainValue = info['weathermain'];
    String icon = info?['icon'] ?? '50d';


    String feels = (info?['feels']?.toString() ?? 'N/A').length >= 4
    ? (info?['feels']?.toString() ?? 'N/A').substring(0, 4)
    : 'N/A';
    // String feels = info?['feels'] ?? 'N/A';
    
    
    // ignore: non_constant_identifier_names
    var Cityname = ["Delhi", "Mumbai", "Ahemdabad", "Chennai", "Kolkata"];
    final random = Random();
    var city = Cityname[random.nextInt(Cityname.length)];
    String getcity = info?['city'] ?? 'N/A';

    // ignore: deprecated_member_use
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 245, 208, 159),
            Color.fromARGB(255, 116, 186, 236)
          ], begin: Alignment.centerLeft, end: Alignment.bottomLeft)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      if (searchc.text == '') {
                        // ignore: avoid_print
                        print('Write City Name');
                        // Some code to undo the change.
                      } else {
                        Navigator.pushReplacementNamed(context, '/loading',
                            arguments: {'searchc': searchc.text});
                      }
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Loading(value:searchc.text)));
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 0, 6, 0),
                      child: const Icon(color: Colors.lightBlue, Icons.search),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                        controller: searchc,
                        decoration: InputDecoration(
                          hintText: ('Search $city...'),
                          border: InputBorder.none,
                        )),
                  ),
                ]),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                              'https://openweathermap.org/img/wn/$icon@2x.png',
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                            return Image.asset('assets/load-failed.png');
                          }),
                          Column(
                            children: [
                              Text(
                                descriptionValue,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("in $getcity",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 250,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(38),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('$tempValue°',
                                    style: const TextStyle(
                                      fontSize: 80,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    )),
                                const Text(" C",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    ))
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        height: 170,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            Column(
                              children: [
                                Text(humidityValue,
                                    style: const TextStyle(
                                      fontSize: 38,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    )),
                                const Text('Percent')
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        height: 170,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  WeatherIcons.thermometer_internal,
                                  size: 32.0,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text('$feels°',
                                    style: const TextStyle(
                                      fontSize: 38,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    )),
                                const Text('C')
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By SR❤️"),
                      Text('Powered by OpenWeatherMap.org')
                    ],
                  ))
            ],
          ),
        ),
        // child: Column(
        //   children: [
        //     // Text(tempValue),
        //     // Text(humidityValue),
        //     // Text(descriptionValue),
        //     // Text(weatherMainValue),
        //   ],
        // ),
      ),
    );
  }
}
