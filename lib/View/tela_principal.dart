import 'package:eco_track/Controller/app_controller.dart';
import 'package:eco_track/View/dashboard.dart';
import 'package:eco_track/View/configuracoes.dart'; // Lembre de criar este arquivo como te mandei antes
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _indiceAtual = 0;

  Widget _construirTelaPrincipal() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            tabs: [
              Tab(icon: Icon(Icons.pending_actions), text: "Pendentes"),
              Tab(icon: Icon(Icons.check_circle_outline), text: "Concluídos"),
            ],
          ),
          // Habitos pendentes
          Expanded(
            child: Consumer<AppController>(
              builder: (context, controller, child) {
                return TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: controller.habitosPendentes.length,
                      itemBuilder: (context, index) {
                        // Armazenando o "valor" de habitos pendentes
                        final habito = controller.habitosPendentes[index];
                        return ListTile(
                          leading: const Icon(Icons.eco, color: Colors.orange),
                          title: Text(habito.titulo),
                          trailing: IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () {
                              // Encontra o index real na lista completa para atualizar
                              int indexGeral = controller.habitos.indexOf(habito);
                              controller.alterarHabito(indexGeral);
                            },
                          ),
                        );
                      },
                    ),
                    // Habitos concluidos
                    ListView.builder(
                      itemCount: controller.habitosConcluidos.length,
                      itemBuilder: (context, index) {
                        final habito = controller.habitosConcluidos[index];
                        return ListTile(
                          leading: const Icon(Icons.done_all, color: Colors.green),
                          title: Text(
                            habito.titulo,
                            style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
                          ),
                          onTap: () {
                            // O usuario tem a opção de clicar para desmarcar
                            int indexGeral = controller.habitos.indexOf(habito);
                            controller.alterarHabito(indexGeral);
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // O que cada ícone da btnBar vai mostrar
    final List<Widget> _paginas = [
      _construirTelaPrincipal(), // Ícone 1: Hábitos
      const DashboardPage(),    // Ícone 2: Dashboard
      const ConfiguracoesPage(), // Ícone 3: Configurações
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoTrack"),
        centerTitle: true,
      ),

      body: _paginas[_indiceAtual],

      // Menu latersal para acesso da pagina principale dashboard
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              // Simula como se o usuario tivesse uma conta no app
              accountName: Text("Usuário"),
              accountEmail: Text("usuario123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white, 
                child: Icon(Icons.person, color: Colors.green)
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("Hábitos"),
              onTap: () {
                setState(() => _indiceAtual = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text("Dashboard"),
              onTap: () {
                setState(() => _indiceAtual = 1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // A btnBar para navegação do usuario. Tem a mesma utilidade da barra de navegação lateral
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Hábitos"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ajustes"),
        ],
      ),

      // Botão flutuante que aparece so na tela de habitos para que um novo habito possa ser adicionado
      floatingActionButton: _indiceAtual == 0 
        ? FloatingActionButton(
            backgroundColor: Colors.green,
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () => _exibirDialogoAdicionar(context),
          )
        : null,
    );
  }

  // Função para abrir a janela para digitar o novo hábito
  void _exibirDialogoAdicionar(BuildContext context) {
    final TextEditingController _controllerInput = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Novo Hábito"),
        content: TextField(
          controller: _controllerInput,
          decoration: const InputDecoration(hintText: "Ex: Economizar água"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
          TextButton(
            onPressed: () {
              if (_controllerInput.text.isNotEmpty) {
                context.read<AppController>().criarHabito(_controllerInput.text);
                Navigator.pop(context);
              }
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }
}