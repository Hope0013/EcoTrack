import 'package:eco_track/Controller/app_controller.dart';
import 'package:eco_track/View/tela_inicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppController(),
      child: MaterialApp(
        home: const TelaInicial(), // Define a Tela Inicial como a primeira
      ),
    ),
  );
}