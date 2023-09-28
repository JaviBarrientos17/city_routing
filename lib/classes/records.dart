class Records {
  final String date;
  final String routeShortName;
  final String tripHeadsign;
  final String stopName;
  final String stopId;
  final String arrivalTime;
  final String departureTime;
  final int exceptionType;
  final int stopSequence;
  final int shapeId;
  final int timepoint;
  final String routeLongName;
  final int routeType;
  final String routeUrl;
  final String routeColor;
  final String routeTextColor;
  final double stopLat;
  final double stopLon;
  final int wheelchairBoarding;

  Records({
    required this.date,
    required this.routeShortName,
    required this.tripHeadsign,
    required this.stopName,
    required this.stopId,
    required this.arrivalTime,
    required this.departureTime,
    required this.exceptionType,
    required this.stopSequence,
    required this.shapeId,
    required this.timepoint,
    required this.routeLongName,
    required this.routeType,
    required this.routeUrl,
    required this.routeColor,
    required this.routeTextColor,
    required this.stopLat,
    required this.stopLon,
    required this.wheelchairBoarding,
  });

  factory Records.fromJson(Map<String, dynamic> json) {
    return Records(
      date: json['date'] ?? '',
      routeShortName: json['route_short_name'] ?? '',
      tripHeadsign: json['trip_headsign'] ?? '',
      stopName: json['stop_name'] ?? '',
      stopId: json['stop_id'] ?? '',
      arrivalTime: json['arrival_time'] ?? '',
      departureTime: json['departure_time'] ?? '',
      exceptionType: json['exception_type'] ?? 0,
      stopSequence: json['stop_sequence'] ?? 0,
      shapeId: json['shape_id'] ?? 0,
      timepoint: json['timepoint'] ?? 0,
      routeLongName: json['route_long_name'] ?? '',
      routeType: json['route_type'] ?? 0,
      routeUrl: json['route_url'] ?? '',
      routeColor: json['route_color'] ?? '',
      routeTextColor: json['route_text_color'] ?? '',
      stopLat: json['stop_lat'] ?? 0.0,
      stopLon: json['stop_lon'] ?? 0.0,
      wheelchairBoarding: json['wheelchair_boarding'] ?? 0,
    );
  }
}
