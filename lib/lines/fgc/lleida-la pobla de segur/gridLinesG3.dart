// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:city_routing/lines/fgc/llobregat-anoia/linies/r5.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/r6.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/s3.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/s4.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/s8.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/s9.dart';
import 'package:city_routing/model/routeImgManager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GridLinesG3());
}

class GridLinesG3 extends StatelessWidget {
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
        itemCount: 6,
        itemBuilder: (context, index) {
          List<String> routeShortNames = ["RL1", "RL2"];
          List<String> imageUrls = [
            RouteImageManager.getImageUrl(routeShortNames[0]),
            RouteImageManager.getImageUrl(routeShortNames[1])
          ];

          List<Widget> destinationPages = [
            // TODO - Añadir lineas del G3
            R5_Line(),
            R6_Line(),
            S3_Line(),
            S4_Line(),
            S8_Line(),
            S9_Line()
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
