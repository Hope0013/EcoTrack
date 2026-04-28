import 'package:eco_track/Controller/app_controller.dart';
import 'package:eco_track/View/dashboard.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Variável para controlar qual página está ativa
  int _indiceAtual = 0;

  // Lista das páginas que você já tem prontas
  final List<Widget> _paginas = [
    const AppController(),    // Índice 0
    const DashboardPage(),  // Índice 1
    const Center(child: Text("Tela de Configurações (A ser feita)")), // Índice 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoTrack"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.eco, color: Colors.green),
          )
        ],
      ),

      body: _paginas[_indiceAtual],

      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Usuário Eco"),
              accountEmail: Text("sustentavel@ecotrack.com"),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.green)),
              decoration: BoxDecoration(color: Colors.green),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("Meus Hábitos"),
              selected: _indiceAtual == 0,
              onTap: () {
                setState(() => _indiceAtual = 0);
                Navigator.pop(context); // Fecha o menu
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text("Dashboard"),
              selected: _indiceAtual == 1,
              onTap: () {
                setState(() => _indiceAtual = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configurações"),
              selected: _indiceAtual == 2,
              onTap: () {
                setState(() => _indiceAtual = 2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}