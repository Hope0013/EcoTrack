import 'package:eco_track/Controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard: Seus Hábitos"), centerTitle: true),
      body: Consumer<AppController>(
        builder: (context, controller, child) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                // Cards com as informeções
                _construtorCard(
                  // Card com "total de habitos"
                  titulo: "Total de Hábitos", 
                  // Pega o "valor" da funçaõ no controller
                  value: controller.totalHabitos.toString(), 
                  icon: Icons.list_alt, 
                  color: const Color.fromARGB(255, 10, 75, 173)),
                _construtorCard(
                  // Card com os habitos concluidos
                  titulo: "Hábitos Concluídas", 
                  // Pega o "valor" da funçaõ no controller
                  value: controller.totalConcluidos.toString(), 
                  icon: Icons.check_circle, 
                  color: const Color.fromARGB(255, 0, 177, 6)),
                _construtorCard(
                  // Card para habitos pendentes
                  titulo: "Hábitos Pendentes", 
                  // Pega o "valor" da funçaõ no controller
                  value: controller.totalPendentes.toString(), 
                  icon: Icons.pending_actions, 
                  color: const Color.fromARGB(255, 255, 218, 54)),
                _construtorCard(
                  // E a porcentagem de habitos concluidos
                  titulo: "Porcentagem de Hábitos Concluídas",
                  // Pega o "valor" da funçaõ no controller 
                  value: controller.pontuacaoEcologica.toString(), 
                  icon: Icons.percent, 
                  color: const Color.fromARGB(255, 160, 59, 255))
              ],
            ),
          );
        },
      ),
    );
  }
}

// Estrutura do card separada para facilitar e deixar o codigo sem repetições desnecessarias

Widget _construtorCard({
  required String titulo,
  required String value,
  required IconData icon,
  required Color color
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color),
      ),
    title: Text(titulo,style: TextStyle(fontWeight: FontWeight.bold)),
    trailing: Text(value,style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color
    ),),
    ),
  );
}

