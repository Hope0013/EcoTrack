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
  final List<Habito> _habitos = []; // Final para que a variavel não mude 
  List<Habito> get habitos => _habitos;

  // Adiciona um novo hábito à lista
  void criarHabito(String titulo) {
    if (titulo.trim().isEmpty) return; // Verifica se o titulo não é vazio
    _habitos.add(Habito(titulo: titulo.trim()));
    notifyListeners();
  }

  // Inverte o status de concluído
  void alterarHabito(int index) {
    _habitos[index].concluida = !_habitos[index].concluida;
    notifyListeners();
  }

  // Exclui o hábito
  void removerHabito(int index) {
    _habitos.removeAt(index);
    notifyListeners();
  }

  // Dashboard

  // Retorna apenas a lista de hábitos que ainda não foram conlcuidos
  List<Habito> get habitosPendentes => 
      _habitos.where((h) => !h.concluida).toList();

  // Retorna apenas a lista de hábitos já realizados
  List<Habito> get habitosConcluidos => 
      _habitos.where((h) => h.concluida).toList();

  int get totalHabitos => _habitos.length;

  int get totalConcluidos => habitosConcluidos.length;

  int get totalPendentes => habitosPendentes.length;

  // Cálculo de pontuação (ex: 10 pontos por hábito concluído)
  double get pontuacaoEcologica => totalConcluidos * 10.0;
}