# EcoTrack - Gerenciamento de Hábitos Sustentáveis

**Especificação dos Requisitos de Software (SRS)** *Estrutura Baseada no ISO/IEC/IEEE 29148:2018*

---

## 1. Identificação do Documento
* **Projeto:** EcoTrack – Gerenciamento de Hábitos Sustentáveis
* **Versão:** 1.0.0
* **Data:** 2026-04-28
* **Autor:** Ana Sofhia

---

## 2. Introdução

### 2.1 Propósito
Documentação focada em descrever os requisitos funcionais e não-funcionais do protótipo **EcoTrack**, focado em incentivar hábitos sustentáveis e gerenciá-los através de uma interface intuitiva e reativa.

### 2.2 Escopo
A aplicação permite o registro de ações ecológicas, monitoramento de progresso e visualização de impacto ambiental.
* **Conceitos Técnicos:** Modelagem de dados orientada a objetos, separação de responsabilidades (Arquitetura inspirada em MVC) e gestão global de estado com o pacote **Provider**.

### 2.3 Visão Geral
Este documento organiza o desenvolvimento em requisitos funcionais, não-funcionais e regras de negócio, garantindo a rastreabilidade entre o código desenvolvido e as necessidades de sustentabilidade urbana.

---

## 3. Requisitos Funcionais (RF)

| ID | Nome | Descrição |
| :--- | :--- | :--- |
| **RF01** | Cadastro de Hábitos | O usuário deve poder inserir títulos de hábitos sustentáveis via botão flutuante (`FloatingActionButton`). |
| **RF02** | Gestão de Status | Marcar hábitos como concluídos, movendo-os automaticamente entre as abas de "Pendentes" e "Concluídos". |
| **RF03** | Navegação Inferior | Alternar entre as telas de Hábitos, Dashboard e Ajustes via `BottomNavigationBar`. |
| **RF04** | Alternância de Temas | O usuário deve poder alternar entre tema claro e escuro através da tela de configurações. |
| **RF05** | Filtros por Aba | A tela de hábitos deve utilizar um `TabBarView` para organizar a visualização dos itens por status. |
| **RF06** | Dashboard de Impacto | Exibir indicadores de progresso (Total, Pendentes, Concluídos e %) em tempo real através de cards estatísticos. |

---

## 4. Requisitos Não-Funcionais (RNF)

| ID | Categoria | Descrição |
| :--- | :--- | :--- |
| **RNF01** | Gestão de Estado | Toda a lógica de negócio e persistência em memória deve ser centralizada na classe `AppController` utilizando `ChangeNotifier`. |
| **RNF02** | Interface (UI) | Uso de widgets estruturais do Material Design como `Scaffold`, `AppBar`, `ListView`, `Card` e `SwitchListTile`. |
| **RNF03** | Responsividade | O layout deve adaptar-se e manter a legibilidade em diferentes temas (Claro e Escuro) e tamanhos de tela. |

---

## 5. Regras de Negócio (RN)

* **RN01 (Reatividade):** Qualquer alteração na lista de hábitos deve refletir-se instantaneamente no Dashboard através do padrão Observer (notificado pelo `notifyListeners`).
* **RN02 (Consistência Visual):** A escolha do tema (Claro/Escuro) deve ser aplicada globalmente em todas as telas do aplicativo via estado global.
* **RN03 (Cálculo de Progresso):** A porcentagem de conclusão é calculada dividindo o número de hábitos concluídos pelo total de hábitos cadastrados, exibindo o resultado com uma casa decimal (ex: 50.0%).

---

## 6. Arquitetura do Sistema

* **Model:** Classe `Habito` (Atributos: `titulo`, `concluida`).
* **Controller (Provider):** `AppController` (Gerencia a lógica de dados, o estado do tema e os cálculos de métricas).
* **View (Telas):**
    * `TelaInicial`: Splash screen com introdução e botão de início.
    * `TelaPrincipal`: Componente central que gerencia o `TabBarView` de hábitos.
    * `DashboardPage`: Página de visualização estatística do progresso ecológico.
    * `ConfiguracoesPage`: Interface para personalização de preferências do sistema.