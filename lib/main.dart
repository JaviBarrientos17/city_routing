import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';

class HorariosPage extends StatefulWidget {
  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  final String zipUrl =
      'https://ssl.renfe.com/ftransit/Fichero_CER_FOMENTO/fomento_transit.zip';

  Future<void> fetchAndProcessData() async {
    final response = await http.get(Uri.parse(zipUrl));

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        if (file.isFile) {
          // Procesa el contenido de cada archivo dentro del ZIP
          final fileContent = String.fromCharCodes(file.content);
          print('Contenido del archivo ${file.name}: $fileContent');
        }
      }
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horarios de trenes'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchAndProcessData,
          child: Text('Descargar y procesar horarios'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HorariosPage(),
  ));
}
