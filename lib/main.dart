import 'package:eco_track/Controller/app_controller.dart';
import 'package:eco_track/View/tela_inicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // O ChangeNotifierProvider para o Provider funcionar
    ChangeNotifierProvider(
      create: (context) => AppController(),
      child: const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch é usado para ler o tema do controller
    bool isDark = context.watch<AppController>().isDarkMode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eco Track',
      // Define o tema com base no que está no Controller
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: const TelaInicial(),
    );
  }
}