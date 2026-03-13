import 'package:flutter/material.dart';
import 'preferencias_service.dart'; // Importante para salvar os dados

// Variáveis globais para simular o banco de dados temporário (em memória)
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

  // Mudamos para 'async' para poder usar o 'await'
  void _cadastrar() async {
    // 1. Salvamos nas variáveis globais (para o login funcionar nesta sessão)
    setState(() {
      usuarioCadastrado = _userC.text;
      senhaCadastrada = _passC.text;
    });

    // 2. SALVANDO PERMANENTEMENTE:
    // Chamamos o serviço que você criou para gravar no celular
    await PreferenciasService.salvarUsuario(_userC.text);

    // 3. Feedback visual para o usuário
    if (!mounted) return; // Segurança do Flutter para garantir que a tela ainda existe
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado e salvo no dispositivo!')),
    );

    // 4. Volta para a tela de login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userC, 
              decoration: const InputDecoration(labelText: 'Novo Usuário')
            ),
            TextField(
              controller: _passC, 
              decoration: const InputDecoration(labelText: 'Nova Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cadastrar, // Chama a função que agora salva no celular
              child: const Text("Confirmar Cadastro"),
            ),
          ],
        ),
      ),
    );
  }
}