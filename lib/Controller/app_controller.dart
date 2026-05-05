import 'package:flutter/material.dart';
import 'package:eco_track/Model/habito.dart';

class AppController extends ChangeNotifier {
  // Inicia com o tema claro
  bool isDarkMode = false; 

  // Muda o tema
  void mudarTema() {
    isDarkMode = !isDarkMode; // Se estiver claro, muda para escuro e vise-versa
    notifyListeners(); 
  }

  // Habitos
  final List<Habito> _habitos = []; // "Final" para que a variavel não mude 
  List<Habito> get habitos => _habitos;

  // Adiciona um novo hábito à lista
  void criarHabito(String titulo) {
    if (titulo.trim().isEmpty) return; // Verifica se o titulo não é vazio
    _habitos.add(Habito(titulo: titulo.trim()));
    notifyListeners();
  }

  // Inverte o status de pendente para concluido ou de concluido para pendente
  void alterarHabito(int index) {
    _habitos[index].concluida = !_habitos[index].concluida;
    notifyListeners();
  }

  // Dashboard

  // Filtra apenas a lista de hábitos que ainda não foram conlcuidos
  List<Habito> get habitosPendentes => 
      _habitos.where((h) => !h.concluida).toList();

  // Filtra apenas a lista de hábitos já realizados
  List<Habito> get habitosConcluidos => 
      _habitos.where((h) => h.concluida).toList();

  int get totalHabitos => _habitos.length; // Pega o total de habitos
  int get totalConcluidos => habitosConcluidos.length; // Pega o total de habitos concluidos
  int get totalPendentes => habitosPendentes.length; // Pega o total de habitos pendentes

  // Calcula a porcentagem de habitos concluidos
  double get pontuacaoEcologica {
    if (_habitos.isEmpty) return 0.0; // Evita erro de divisão por zero
    double porcentagem = (totalConcluidos / totalHabitos) * 100;
    return double.parse(porcentagem.toStringAsFixed(1)); // Garante que o retorno não seja com uma dizima infinita
  }
}