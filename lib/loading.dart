// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/background.dart';
import 'calling_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String temperature = "Loading";

  late String temp;
  late String humidityy;
  late String description;
  late String weathermain;
  late String icon;
  late String feels;
  late String city = 'delhi';

  void startApp(BuildContext context) async {
    Calling instance = Calling(location: city);
    await instance.getdata();
    // setState(() {
    //   temperature = instance.humidityy;
    // });
    temp = instance.temp;
    humidityy = instance.humidityy;
    description = instance.description;
    weathermain = instance.weathermain;
    feels = instance.feels;
    icon = instance.icon;

    print(instance.description);
    print(instance.humidityy);
    print(feels);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'tempvalue': temp,
      'humidityy': humidityy,
      'description': description,
      'weathermain': weathermain,
      'feels': feels,
      'icon': icon,
      'city': city,
    });
    // Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    startApp(context);
  }

  @override
  Widget build(BuildContext context) {
    Map? searchdata = ModalRoute.of(context)?.settings.arguments as Map?;
    if (searchdata?.isNotEmpty?? false) {
      city = searchdata?['searchc'];
      startApp(context);
    }
    // print(searchdata);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/mlogo.png',
            // scale: 1.0,
            height: 275,
            width: 470,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Weather Updates',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 25, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          const SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          )
        ],
      )),
      backgroundColor: const Color.fromARGB(255, 113, 105, 57),
    );
  }
}
