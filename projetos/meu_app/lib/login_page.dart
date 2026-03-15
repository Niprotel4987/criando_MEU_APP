import 'package:flutter/material.dart';
import 'cadastro_page.dart'; // Para ler as variáveis globais
import 'profile_page.dart';
import 'preferencias_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async {
    var dados = await PreferenciasService.buscarDados();
    if (dados['nome'] != null) {
      // Atualiza a RAM com o que veio do Disco
      usuarioCadastrado = dados['nome']!;
      senhaCadastrada = dados['senha']!;
    }
  }

  void _fazerLogin() {
    if (_userController.text == usuarioCadastrado && _passController.text == senhaCadastrada) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage(user: _userController.text)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro no login")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          TextField(controller: _userController, decoration: const InputDecoration(labelText: "Usuário")),
          TextField(controller: _passController, decoration: const InputDecoration(labelText: "Senha"), obscureText: true),
          ElevatedButton(onPressed: _fazerLogin, child: const Text("Entrar")),
          TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastroPage())),
            child: const Text("Criar Conta"),
          )
        ],
      ),
    );
  }
}
