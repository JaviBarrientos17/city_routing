// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:city_routing/lines/fgc/llobregat-anoia/linies/gridLines.dart';
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
                    builder: (context) => GridLines(),
                  ),
                );
              },
              child: Text('Linea Barcelona – Vallés'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GridLines(),
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
                    builder: (context) => GridLines(),
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
