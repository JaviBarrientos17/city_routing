// ignore_for_file: prefer_const_constructors, camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:city_routing/api/api.dart';
import 'package:city_routing/model/routeImgManager.dart';
import 'package:city_routing/model/records.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(R50_Line());
}

class R50_Line extends StatefulWidget {
  @override
  _R50_LineState createState() => _R50_LineState();
}

class _R50_LineState extends State<R50_Line> {
  List<Records> recordsList = [];
  var logger = Logger();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('R50', textAlign: TextAlign.center)),
      ),
      body: FutureBuilder(
        future: _fetchFGCData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar los datos'),
            );
          } else {
            return _buildList();
          }
        },
      ),
    );
  }

  Future<void> _fetchFGCData() async {
    final data = await ApiService.getFGCData();
    final currentTime = DateTime.now();
    recordsList = data
        .where((record) => _isDepartureTimeAfterCurrentTime(
            record.departure_time, currentTime))
        .toList();
    recordsList.sort(
        (a, b) => _compareDepartureTimes(a.departure_time, b.departure_time));
  }

  bool _isDepartureTimeAfterCurrentTime(
      String departureTime, DateTime currentTime) {
    final departureParts = departureTime.split(':');
    final departureHour = int.tryParse(departureParts[0]);
    final departureMinute = int.tryParse(departureParts[1]);

    if (departureHour != null && departureMinute != null) {
      final departureDateTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        departureHour,
        departureMinute,
      );

      return departureDateTime.isAfter(currentTime);
    }

    return false;
  }

  int _compareDepartureTimes(String time1, String time2) {
    final time1Parts = time1.split(':');
    final time2Parts = time2.split(':');

    final hour1 = int.parse(time1Parts[0]);
    final minute1 = int.parse(time1Parts[1]);

    final hour2 = int.parse(time2Parts[0]);
    final minute2 = int.parse(time2Parts[1]);

    if (hour1 < hour2) {
      return -1;
    } else if (hour1 > hour2) {
      return 1;
    } else {
      if (minute1 < minute2) {
        return -1;
      } else if (minute1 > minute2) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  Widget _buildList() {
    return Center(
      child: ListView.builder(
        itemCount: recordsList.length,
        itemBuilder: (context, index) {
          final routeShortName = recordsList[index].route_short_name;
          final wheelchairBoarding = recordsList[index].wheelchair_boarding;

          Icon icon;
          Color iconColor;

          if (wheelchairBoarding == 1) {
            icon = Icon(Icons.accessible);
            iconColor = Colors.black;
          } else {
            icon = Icon(Icons.not_accessible);
            iconColor = Colors.black;
          }

          final recordDate = recordsList[index].date;
          final formattedDate = dateFormat.format(DateTime.parse(recordDate));

          final showDateSeparator = index == 0 ||
              formattedDate !=
                  dateFormat
                      .format(DateTime.parse(recordsList[index - 1].date));

          return Column(
            children: <Widget>[
              if (showDateSeparator)
                ListTile(
                  title: Text(
                    formattedDate,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ListTile(
                leading: Image.network(
                    RouteImageManager.getImageUrl(routeShortName)),
                title: Text(recordsList[index].route_long_name),
                subtitle: Text(recordsList[index].departure_time),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon.icon,
                      color: iconColor,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
