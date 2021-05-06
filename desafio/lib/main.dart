import 'package:desafio/filme_controller.dart';
import 'package:desafio/filme_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio',
      theme: ThemeData(brightness: Brightness.dark),
      home: FilmeView(),
    );
  }
}
