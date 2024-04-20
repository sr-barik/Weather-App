// import 'dart:convert';
// import 'package:http/http.dart';

// class Calling {
//   String location;
//   Calling({required this.location});

//   late String temp;
//   late String humidityy;
//   late String description;
//   late String weathermain;
//   late String icon;
//   late String feels;
//   late String getfeels; // This is a class-level variable

//   Future<void> getdata() async {
//     Response response = await get(Uri.parse(
//         "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9938a67ec1e0323e539196564d585e49"));
//     Map<String, dynamic> apidata = jsonDecode(response.body);
//     Map<String, dynamic> main = apidata["main"];

//     // Use double directly, no need for Double from dart:ffi
//     double getTemp = (main["temp"] - 273.15).toDouble();

//     int getHumidity = main["humidity"];
//     List<dynamic> weather = apidata["weather"];
//     Map<String, dynamic> mapWeather = weather[0] as Map<String, dynamic>;
//     String getMain = mapWeather["main"];
//     String getDescription = mapWeather["description"];
//     String iconvalue = mapWeather["icon"].toString();
//     double feelsValue = (main["feels_like"] - 273.15)
//         .toDouble(); // Use a different variable name here

//     // Set the temp variable with the converted temperature
//     temp = getTemp.toStringAsFixed(3);
//     humidityy = getHumidity.toString();
//     description = getDescription;
//     weathermain = getMain;
//     getfeels =
//         feelsValue.toString(); // Assign the value to the class-level variable
//     icon = iconvalue;
//     feels = getfeels.substring(0, 4);
//   }
// }
// import 'dart:convert';
// import 'package:http/http.dart';

// class Calling {
//   String location;
//   Calling({required this.location});

//   late String temp;
//   late String humidityy;
//   late String description;
//   late String weathermain;
//   late String icon;
//   late String feels;
//   late String getfeels; // This is a class-level variable

//   Future<void> getdata() async {
//     try {
//       Response response = await get(Uri.parse(
//           "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9938a67ec1e0323e539196564d585e49"));

//       if (response.statusCode == 200) {
//         Map<String, dynamic> apidata = jsonDecode(response.body);
//         Map<String, dynamic> main = apidata["main"];

//         // Use double directly, no need for Double from dart:ffi
//         double getTemp = (main["temp"] - 273.15).toDouble();

//         int getHumidity = main["humidity"];
//         List<dynamic> weather = apidata["weather"];
//         Map<String, dynamic> mapWeather = weather[0] as Map<String, dynamic>;
//         String getMain = mapWeather["main"];
//         String getDescription = mapWeather["description"];
//         String iconvalue = mapWeather["icon"].toString();
//         double feelsValue = (main["feels_like"] - 273.15)
//             .toDouble(); // Use a different variable name here

//         // Set the temp variable with the converted temperature
//         temp = getTemp.toStringAsFixed(3);
//         humidityy = getHumidity.toString();
//         description = getDescription;
//         weathermain = getMain;
//         getfeels =
//             feelsValue.toString(); // Assign the value to the class-level variable
//         icon = iconvalue;
//         feels = getfeels.substring(0, 4);
//       } else {
//         // Default values if the response status code is not 200
//         temp = 'N/A';
//         humidityy = 'N/A';
//         description = 'N/A';
//         weathermain = 'N/A';
//         getfeels = 'N/A';
//         icon = 'N/A';
//         feels = 'N/A';
//       }
//     } catch (e) {
//       // Handle any exceptions that may occur during the HTTP request
//       print("Error fetching data: $e");

//       // Default values in case of an error
//       temp = 'N/A';
//       humidityy = 'N/A';
//       description = 'N/A';
//       weathermain = 'N/A';
//       getfeels = 'N/A';
//       icon = 'N/A';
//       feels = 'N/A';
//     }
//   }
// }

import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/errorscreen.dart';
import 'package:http/http.dart';

class Calling {
  String location;
  Calling({required this.location});

  late String temp;
  late String humidityy;
  late String description;
  late String weathermain;
  late String icon;
  late String feels;
  late String getfeels; // This is a class-level variable

  Future<void> getdata() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9938a67ec1e0323e539196564d585e49"));

      if (response.statusCode == 200) {
        Map<String, dynamic> apidata = jsonDecode(response.body);
        Map<String, dynamic>? main = apidata["main"] as Map<String, dynamic>?;

        if (main != null) {
          // Use double directly, no need for Double from dart:ffi
          double getTemp = (main["temp"] - 273.15).toDouble();

          int? getHumidity = main["humidity"];
          List<dynamic> weather = apidata["weather"];
          Map<String, dynamic>? mapWeather =
              weather.isNotEmpty ? weather[0] as Map<String, dynamic>? : null;

          if (mapWeather != null) {
            String getMain = mapWeather["main"];
            String getDescription = mapWeather["description"];
            String iconvalue = mapWeather["icon"].toString();
            double feelsValue = (main["feels_like"] - 273.15)
                .toDouble(); // Use a different variable name here

            // Set the temp variable with the converted temperature
            temp = getTemp.toStringAsFixed(3);
            humidityy = getHumidity?.toString() ?? 'N/A';
            description = getDescription;
            weathermain = getMain;
            getfeels = feelsValue
                .toString(); // Assign the value to the class-level variable
            icon = iconvalue;
            feels = getfeels.substring(0, 4);
          } else {
            // Set default values if weather data is null
            temp = 'N/A';
            humidityy = 'N/A';
            description = 'N/A';
            weathermain = 'N/A';
            getfeels = 'N/A';
            icon = 'N/A';
            feels = 'N/A';
          }
        } else {
          // Set default values if main data is null
          temp = 'N/A';
          humidityy = 'N/A';
          description = 'N/A';
          weathermain = 'N/A';
          getfeels = 'N/A';
          icon = 'N/A';
          feels = 'N/A';
        }
      } else {
        // Default values if the response status code is not 200
        temp = 'N/A';
        humidityy = 'N/A';
        description = 'N/A';
        weathermain = 'N/A';
        getfeels = 'N/A';
        icon = 'N/A';
        feels = 'N/A';
      }
    } catch (e) {
      // Handle any exceptions that may occur during the HTTP request
      // print("Error fetching data: $e");

      // Default values in case of an error
      temp = 'N/A';
      humidityy = 'N/A';
      description = 'N/A';
      weathermain = 'N/A';
      getfeels = 'N/A';
      icon = 'N/A';
      feels = 'N/A';
    }
      
  }
}
