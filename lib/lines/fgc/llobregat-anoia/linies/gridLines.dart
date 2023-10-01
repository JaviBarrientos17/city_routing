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
        itemCount: 6,
        itemBuilder: (context, index) {
          List<String> routeShortNames = ["R5", "R6", "S3", "S4", "S8", "S9"];
          List<String> imageUrls = [
            RouteImageManager.getImageUrl(routeShortNames[0]),
            RouteImageManager.getImageUrl(routeShortNames[1]),
            RouteImageManager.getImageUrl(routeShortNames[2]),
            RouteImageManager.getImageUrl(routeShortNames[3]),
            RouteImageManager.getImageUrl(routeShortNames[4]),
            RouteImageManager.getImageUrl(routeShortNames[5]),
          ];

          List<Widget> destinationPages = [
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
