import 'package:flutter/material.dart';

// Variáveis globais para simular o banco de dados temporário
String usuarioCadastrado = "";
String senhaCadastrada = "";

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _userC = TextEditingController();
  final _passC = TextEditingController();

  void _cadastrar() {
    setState(() {
      usuarioCadastrado = _userC.text;
      senhaCadastrada = _passC.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro realizado!')));
    Navigator.pop(context); // Volta para a tela de login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userC, decoration: const InputDecoration(labelText: 'Novo Usuário')),
            TextField(controller: _passC, decoration: const InputDecoration(labelText: 'Nova Senha'), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _cadastrar, child: const Text("Confirmar Cadastro")),
          ],
        ),
      ),
    );
  }
}