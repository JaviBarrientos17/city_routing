import 'package:city_routing/classes/records.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Records> fetchData() async {
  try {
    final response = await http.get(Uri.parse(
        'https://dadesobertes.fgc.cat/api/explore/v2.1/catalog/datasets/viajes-de-hoy/records'));

    if (response.statusCode == 200) {
      // Imprimir los datos del response en la consola
      print('Response body: ${response.body}');

      return Records.fromJson(jsonDecode(response.body));
    } else {
      // Si el estado de la respuesta no es 200, lanza una excepción
      throw Exception('Failed to load records');
    }
  } catch (e) {
    // Captura y maneja cualquier excepción que ocurra durante la solicitud
    print('Error al obtener datos: $e');
    rethrow; // Relanza la excepción para que pueda ser manejada en el código que llama a fetchData
  }
}
