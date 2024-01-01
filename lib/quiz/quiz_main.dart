import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: Colors.deepPurple,
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
