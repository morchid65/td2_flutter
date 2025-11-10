// lib/UI/card3.dart
import 'package:flutter/material.dart';

class Card3 extends StatelessWidget { 
  const Card3({super.key}); // AJOUT de 'const'

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Écran Card 3',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}