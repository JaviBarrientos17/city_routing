import 'package:flutter/material.dart';
import 'api/api.dart' as api;
import 'package:city_routing/classes/records.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'City Routing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Records> _routeData;

  @override
  void initState() {
    super.initState();
    _routeData = _fetchData(); // Asigna el resultado de la función _fetchData()
  }

  Future<Records> _fetchData() async {
    try {
      final response = await api.fetchData();
      return response; // Retorna el resultado para asignarlo a _routeData
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Relanza la excepción para manejarla en otro lugar si es necesario
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Records>(
          future: _routeData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No se recibieron datos de la API');
            } else {
              final records = snapshot.data!;

              return ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Date: ${records.date}'),
                  ),
                  ListTile(
                    title: Text('Route Short Name: ${records.routeShortName}'),
                  ),
                  ListTile(
                    title: Text('Trip Headsign: ${records.tripHeadsign}'),
                  ),
                  // Repite esto para los demás atributos de Records
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
