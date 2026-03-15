import 'package:flutter/material.dart';
import 'preferencias_service.dart';

// Definimos aqui para que o login_page possa enxergar
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

  void _cadastrar() async {
    if (_userC.text.isEmpty || _passC.text.isEmpty) return;

    // Salva na RAM
    usuarioCadastrado = _userC.text;
    senhaCadastrada = _passC.text;

    // Salva no Disco
    await PreferenciasService.salvarDados(_userC.text, _passC.text);

    if (!mounted) return;
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo Cadastro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userC, decoration: const InputDecoration(labelText: 'Usuário')),
            TextField(controller: _passC, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
            ElevatedButton(onPressed: _cadastrar, child: const Text("Confirmar")),
          ],
        ),
      ),
    );
  }
}
