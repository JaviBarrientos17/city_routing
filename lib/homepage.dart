// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:city_routing/model/records.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  List<Records> recordsList = [];

  // Get FGC API data
  Future<void> getFGCData() async {
    try {
      var response = await http.get(
        Uri.https(
          "dadesobertes.fgc.cat",
          "/api/explore/v2.1/catalog/datasets/viajes-de-hoy/records",
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('results') && jsonData['results'] is List) {
          for (var eachData in jsonData['results']) {
            final record = Records(
              date: eachData['date'] ?? '',
              route_short_name: eachData['route_short_name'] ?? '',
              trip_headsign: eachData['tripHeadsign'] ?? '',
              stop_name: eachData['stopName'] ?? '',
              stop_id: eachData['stopId'] ?? '',
              arrival_time: eachData['arrivalTime'] ?? '',
              departure_time: eachData['departure_time'] ?? '',
              exception_type: eachData['exceptionType'] ?? 0,
              stop_sequence: eachData['stopSequence'] ?? 0,
              shape_id: eachData['shapeId'] ?? 0,
              timepoint: eachData['timepoint'] ?? 0,
              route_long_name: eachData['route_long_name'] ?? '',
              route_type: eachData['routeType'] ?? 0,
              route_url: eachData['routeUrl'] ?? '',
              route_color: eachData['routeColor'] ?? '',
              route_text_color: eachData['routeTextColor'] ?? '',
              stop_lat: eachData['stopLat'] ?? 0.0,
              stop_lon: eachData['stopLon'] ?? 0.0,
              wheelchair_boarding: eachData['wheelchairBoarding'] ?? 0,
            );
            recordsList.add(record);
          }
          setState(() {});
        } else {
          logger
              .d("Results field is missing or not a List in the API response");
        }
      } else {
        logger.e("Failed to load data from the API");
      }
    } catch (e) {
      logger.e("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getFGCData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("City Routing", textAlign: TextAlign.center)),
      ),
      body: recordsList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: recordsList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(recordsList[index].route_short_name),
                  title: Text(recordsList[index].route_long_name),
                  subtitle: Text(recordsList[index].departure_time),
                  trailing:
                      Text(recordsList[index].wheelchair_boarding.toString()),
                );
              },
            ),
    );
  }
}
