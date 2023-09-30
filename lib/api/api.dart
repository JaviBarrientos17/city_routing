import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:city_routing/model/records.dart';
import 'package:logger/logger.dart';

class ApiService {
  static Future<List<Records>> getFGCData() async {
    final List<Records> recordsList = [];
    var logger = Logger();

    // TODO - Crear un método fetch como este para cada una de las líneas para evitar problemas

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

    return recordsList;
  }
}
