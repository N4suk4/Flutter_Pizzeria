import 'package:flutter/material.dart';

class Boisson {
  final int id;
  final String nom;
  final String image;
  final double teneurEnSucre;

  Boisson({required this.id, required this.nom, required this.image, required this.teneurEnSucre});

  Boisson.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nom = json['nom'],
      image = json['image'],
      teneurEnSucre = json['teneurEnSucre'];

  Widget teneurEnSucreBar() {
    Color barColor;
    if (teneurEnSucre < 5) {
      barColor = Colors.green;
    } else if (teneurEnSucre < 10) {
      barColor = Colors.yellow;
    } else {
      barColor = Colors.red;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Teneur en sucre: ${teneurEnSucre.toStringAsFixed(1)}g'),
        LinearProgressIndicator(
          value: teneurEnSucre / 15,
          backgroundColor: Colors.grey[300],
          color: barColor,
          minHeight: 10,
        ),
      ],
    );
  }
}