import 'package:flutter/material.dart';

class EstoquePage extends StatelessWidget {
  const EstoquePage({super.key});

  // Simulando uma lista de dados que viria de um banco de dados ou do SAP
  final List<Map<String, String>> produtos = const [
    {"codigo": "A102", "nome": "Pallet de Madeira", "posicao": "RUA 12 - N2"},
    {"codigo": "B504", "nome": "Filme Stretch", "posicao": "ALMOX - PR01"},
    {"codigo": "C201", "nome": "Fita Adesiva 45mm", "posicao": "EXPEDIÇÃO"},
    {"codigo": "D900", "nome": "Cantoneira Plástica", "posicao": "RUA 05 - N4"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulta de Estoque"),
        backgroundColor: Colors.blueGrey, // Cor voltada para ambiente corporativo
      ),
      body: ListView.builder(
        itemCount: produtos.length, // Quantidade de itens na lista
        itemBuilder: (context, index) {
          final item = produtos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.inventory_2, color: Colors.blueGrey), // Ícone de caixa
              title: Text("${item['nome']}"), // Nome do produto
              subtitle: Text("Posição: ${item['posicao']}"), // Onde ele está no armazém
              trailing: Text(
                "#${item['codigo']}", // Código do produto (como no SAP)
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              onTap: () {
                // Aqui poderíamos abrir detalhes do item no futuro
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Detalhes do item ${item['codigo']}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}