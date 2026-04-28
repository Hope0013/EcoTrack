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
                //lista de Card (informações do controller)
                _construtorCard(
                  titulo: "Total de Hábitos", 
                  value: controller.totalHabitos.toString(), 
                  icon: Icons.list_alt, 
                  color: const Color.fromARGB(255, 10, 75, 173)),
                _construtorCard(
                  titulo: "Hábitos Concluídas", 
                  value: controller.totalConcluidos.toString(), 
                  icon: Icons.check_circle, 
                  color: const Color.fromARGB(255, 0, 177, 6)),
                _construtorCard(
                  titulo: "Hábitos Pendentes", 
                  value: controller.totalPendentes.toString(), 
                  icon: Icons.pending_actions, 
                  color: const Color.fromARGB(255, 255, 218, 54)),
                _construtorCard(
                  titulo: "Porcentagem de Hábitos Concluídas", 
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

//criar um widget para para facilitar a criação dos card

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

