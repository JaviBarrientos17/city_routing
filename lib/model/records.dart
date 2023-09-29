// ignore_for_file: non_constant_identifier_names

class Records {
  final String date;
  final String route_short_name;
  final String trip_headsign;
  final String stop_name;
  final String stop_id;
  final String arrival_time;
  final String departure_time;
  final int exception_type;
  final int stop_sequence;
  final int shape_id;
  final int timepoint;
  final String route_long_name;
  final int route_type;
  final String route_url;
  final String route_color;
  final String route_text_color;
  final double stop_lat;
  final double stop_lon;
  final int wheelchair_boarding;

  Records({
    required this.date,
    required this.route_short_name,
    required this.trip_headsign,
    required this.stop_name,
    required this.stop_id,
    required this.arrival_time,
    required this.departure_time,
    required this.exception_type,
    required this.stop_sequence,
    required this.shape_id,
    required this.timepoint,
    required this.route_long_name,
    required this.route_type,
    required this.route_url,
    required this.route_color,
    required this.route_text_color,
    required this.stop_lat,
    required this.stop_lon,
    required this.wheelchair_boarding,
  });
}
