import 'package:flutter/material.dart';
import 'cadastro_page.dart'; // Importa para acessar as variáveis de cadastro
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _fazerLogin() {
    // Compara com as variáveis globais definidas no cadastro_page.dart
    if (_userController.text == usuarioCadastrado && _passController.text == senhaCadastrada && usuarioCadastrado != "") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage(user: _userController.text)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha inválidos ou não cadastrados!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userController, decoration: const InputDecoration(labelText: 'Usuário')),
            TextField(controller: _passController, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _fazerLogin, child: const Text("Entrar")),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastroPage())),
              child: const Text("Não tem conta? Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}