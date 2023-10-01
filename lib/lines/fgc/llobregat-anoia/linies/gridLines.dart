// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:city_routing/lines/fgc/llobregat-anoia/linies/r5.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/r6.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/s3.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/s4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GridLines());
}

class GridLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO - Mostrar nombre de la línea a la cual se ha hecho clic en la pantalla anterior
        title: Text('Grid de Imágenes'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          // TODO - Obtener las imgs del método routeImageManager()
          List<String> imageUrls = [
            'https://bit.ly/46tkIxZ',
            'https://bit.ly/45fbTXk',
            'https://bit.ly/46wpJG4',
            'https://bit.ly/45cQLkz'
          ];

          List<Widget> destinationPages = [
            R5_Line(),
            R6_Line(),
            S3_Line(),
            S4_Line()
          ];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => destinationPages[index],
                ),
              );
            },
            child: Card(
              elevation: 3,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => destinationPages[index],
                        ),
                      );
                    },
                    child: Image.network(imageUrls[index]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
