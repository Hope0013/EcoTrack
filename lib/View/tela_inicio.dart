import 'package:eco_track/Controller/app_controller.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea impede que o conteúdo fique sob o entalhe (notch) ou barra de status
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // --- 1. LOGO E TÍTULO ---
              Column(
                children: [
                  const Icon(
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

              // --- 2. ILUSTRAÇÃO CENTRAL ---
              // Usamos um Container com cor de fundo leve para simular a área da imagem
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.nature_people, 
                  size: 120, 
                  color: Colors.green
                ),
              ),

              // --- 3. TEXTO DESCRITIVO ---
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

              // --- 4. BOTÃO DE AÇÃO ---
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
                  onPressed: () {
                    // Navigator.pushReplacement substitui a tela atual 
                    // para o usuário não voltar para a Splash ao apertar "voltar"
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const AppController()),
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