import 'dart:html';

import 'package:flutter/material.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "SELECT YOUR SKILL",
              style: TextStyle(
                  fontSize: 54,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF26206F)),
            ),
          )
        ],
      ),
    );
  }
}
