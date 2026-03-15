import 'package:flutter/material.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  // O Controller permite que a gente limpe o texto do campo via código
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _todosProdutos = const [
    {"codigo": "A102", "nome": "Pallet de Madeira", "posicao": "RUA 12 - N2"},
    {"codigo": "B504", "nome": "Filme Stretch", "posicao": "ALMOX - PR01"},
    {"codigo": "C201", "nome": "Fita Adesiva 45mm", "posicao": "EXPEDIÇÃO"},
    {"codigo": "D900", "nome": "Cantoneira Plástica", "posicao": "RUA 05 - N4"},
  ];

  List<Map<String, String>> _produtosFiltrados = [];

  @override
  void initState() {
    super.initState();
    _produtosFiltrados = _todosProdutos;
  }

  void _filtrarProdutos(String termo) {
    setState(() {
      if (termo.isEmpty) {
        _produtosFiltrados = _todosProdutos;
      } else {
        _produtosFiltrados = _todosProdutos
            .where((p) =>
                p['nome']!.toLowerCase().contains(termo.toLowerCase()) ||
                p['codigo']!.toLowerCase().contains(termo.toLowerCase()))
            .toList();
      }
    });
  }

  // Função para limpar a busca e resetar a lista
  void _limparBusca() {
    _searchController.clear(); // Limpa o texto no TextField
    _filtrarProdutos("");      // Reseta a lista para mostrar tudo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estoque SAP/WMS"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController, // Vincula o controle ao campo
              onChanged: _filtrarProdutos,
              decoration: InputDecoration(
                labelText: 'Pesquisar produto ou código...',
                prefixIcon: const Icon(Icons.search),
                
                // BOTÃO DE LIMPAR (SuffixIcon)
                // Só mostra o ícone de "X" se o campo não estiver vazio
                suffixIcon: _searchController.text.isNotEmpty 
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _limparBusca,
                    )
                  : null,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          
          Expanded(
            child: _produtosFiltrados.isEmpty
                ? const Center(child: Text("Nenhum item encontrado no estoque."))
                : ListView.builder(
                    itemCount: _produtosFiltrados.length,
                    itemBuilder: (context, index) {
                      final item = _produtosFiltrados[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey[50],
                            child: const Icon(Icons.inventory, color: Colors.blueGrey),
                          ),
                          title: Text(item['nome']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("Posição: ${item['posicao']}"),
                          trailing: Text(
                            item['codigo']!,
                            style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}