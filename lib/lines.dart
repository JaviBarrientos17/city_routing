// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:city_routing/lines/fgc/llobregat-anoia/r5.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Lines());
}

class Lines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid de Imágenes'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          List<String> imageUrls = [
            'https://bit.ly/46tkIxZ',
            'https://bit.ly/48wLF5J',
            'https://bit.ly/45fbTXk',
            'https://bit.ly/48xzpBX',
            'https://bit.ly/3PTUM9b',
            'https://bit.ly/46wpJG4',
            'https://bit.ly/45cQLkz',
            'https://bit.ly/48xlpYS',
          ];

          List<Widget> destinationPages = [
            R5_Line(),
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
