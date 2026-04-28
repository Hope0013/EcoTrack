# EcoTrack - Gerenciamento de Hábitos Sustentáveis


Especificação dos Requisitos de Software (SRE)

Estrutura Baseada no ISO/IEC/IEE 29148:2018

## 1. Identificação do Documento
* **Projeto:** EcoTrack – Gerenciamento de Hábitos Sustentáveis
* **Versão:** 1.0.0
* **Data:** 2026-04-28
* **Autor:** Ana Sofhia

---

## 2. Introdução
### 2.1 Propósito
Documentação focada em descrever os requisitos funcionais e não-funcionais do protótipo **EcoTrack**, focado em incentivar hábitos sustentáveis e gerenciá-los.

### 2.2 Escopo
A aplicação permitirá o registo de ações ecológicas, monitorização de metas e visualização de impacto ambiental.
* **Conceitos:** Modelagem de dados, separação de lógica (MVC) e gestão global de estado com Provider.

### 2.3 Visão Geral
Este documento segue as diretrizes da norma **ISO/IEC/IEEE 29148:2018**, organizando o desenvolvimento em requisitos funcionais, não-funcionais e regras de negócio.

---

## 3. Requisitos Funcionais (RF)
| ID | Nome | Descrição |
| :--- | :--- | :--- |
| **RF01** | Cadastro de Hábitos | O usuáio deve poder inserir títulos de hábitos sustentáveis (ex: "Economizar água"). |
| **RF02** | Gestão de Status | Marcar hábitos como concluídos, movendo-os automaticamente para a lista de "Hábitos Concluídos". |
| **RF03** | Navegação Inferior | Alternar entre Dashboard, Hábitos e Configurações via `BottomNavigationBar`. |
| **RF04** | Navegação Lateral | Disponibilizar um `Drawer` com acesso rápido a todas as áreas do sistema. |
| **RF05** | Filtros por Aba | A tela de hábitos deve conter um `TabBarView` separando Pendentes de Concluídos. |
| **RF06** | Dashboard de Impacto | Exibir indicadores de progresso num `GridView` com cards informativos. |

---

## 4. Requisitos Não-Funcionais (RNF)
| ID | Categoria | Descrição |
| :--- | :--- | :--- |
| RNF01 | Gestão de Estado | Toda a lógica de navegação e dados deve ser centralizada num ChangeNotifier utilizando o pacote Provider. |
| RNF02 | Interface (UI) | Uso de widgets estruturais como Scaffold, AppBar, ListView e GridView. |
| RNF03 | Responsividade | O layout deve adaptar-se a diferentes tamanhos de tela. |

---

## 5. Regras de Negócio (RN)
* **RN01 (Atualização Automática):** Qualquer alteração na lista de hábitos deve refletir-se instantaneamente no Dashboard sem recarregar a página manualmente.
* **RN02 (Persistência Visual):** A aba selecionada no `BottomNavigationBar` deve ser controlada pelo estado global para manter a consistência entre menus.
* **RN03 (Cálculo de Progresso):** A percentagem de conclusão deve ser calculada dividindo hábitos concluídos pelo total de hábitos ativos.

---

## 6. Arquitetura
* **Model:** Classe `Habito` (título, status, data).
* **Controller (Provider):** `EcoProvider` para gerir listas e o índice da tela ativa.
* **View:** Pastas separadas para as telas de Dashboard, Hábitos e Configurações.