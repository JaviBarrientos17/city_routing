// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:city_routing/lines.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('City routing', textAlign: TextAlign.center)),
      ),
      body: Center(
        child: Container(
          color: Colors.black, // Color de fondo negro
          child: GestureDetector(
            onTap: () {
              // Navegar a la página de detalles cuando se hace clic en la imagen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Lines(),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://bit.ly/3ZE5vI5',
                  width: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
