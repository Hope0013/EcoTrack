// Crie o arquivo: lib/View/configuracoes.dart
import 'package:eco_track/Controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, controller, child) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SwitchListTile(
              // Cria o botão de moda claro/escuro
              title: const Text("Modo Escuro"),
              subtitle: const Text("Alterar o tema do aplicativo"),
              value: controller.isDarkMode,
              activeColor: Colors.green,
              onChanged: (value) {
                // Usa a função criada no controller para mudar o tema do app
                controller.mudarTema();
              },
              secondary: Icon(
                // Alterna o ícone dependendo do tema
                controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}