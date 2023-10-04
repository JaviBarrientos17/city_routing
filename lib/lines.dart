// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:city_routing/lines/fgc/barcelona-valles/gridLinesG1.dart';
import 'package:city_routing/lines/fgc/lleida-la%20pobla%20de%20segur/gridLinesG3.dart';
import 'package:city_routing/lines/fgc/llobregat-anoia/linies/gridLinesG2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Lines());
}

class Lines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FGC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // TODO - Cambiar a lineas de Barcelona - Vallés
                    builder: (context) => GridLinesG1(),
                  ),
                );
              },
              child: Text('Linea Barcelona – Vallés'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GridLinesG2(),
                  ),
                );
              },
              child: Text('Linea Llobregat – Anoia'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // TODO - Cambiar a lineas de Lleida - La Pobla
                    builder: (context) => GridLinesG3(),
                  ),
                );
              },
              child: Text('Linia Lleida – La Pobla de Segur'),
            ),
          ],
        ),
      ),
    );
  }
}
