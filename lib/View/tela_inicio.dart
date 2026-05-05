import 'package:flutter/material.dart';
import 'package:eco_track/View/tela_principal.dart'; 

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // SafeArea impede que o conteúdo fique sobre outros elementos da tela
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Icon(
                    // Coloca o icon de folha para fazer como se fosse uma logo
                    Icons.eco, 
                    size: 100, 
                    color: Colors.green
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "ECO TRACK",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              Container(
                // Container onde tera um icon e o texto resumindo a função do app
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.nature_people,
                  size: 120,
                  color: Colors.green,
                ),
              ),

              const Text(
                "Acompanhe seus hábitos sustentáveis e veja seu impacto positivo no planeta.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  // Botão para o usuario ir para a tela principal do app
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const TelaPrincipal()),
                    );
                  },
                  child: const Text(
                    "COMEÇAR",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}