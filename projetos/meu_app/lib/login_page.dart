import 'package:flutter/material.dart';
import 'cadastro_page.dart'; 
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
    String usuarioDigitado = _userController.text;
    String senhaDigitada = _passController.text;

    // 1º FILTRO: Verifica se os campos estão em branco
    if (usuarioDigitado.isEmpty || senhaDigitada.isEmpty) {
      _mostrarMensagem('Por favor, preencha todos os campos!');
      return; // O 'return' para a execução aqui e não deixa prosseguir
    }

    // 2º FILTRO: Verifica se alguém já se cadastrou (se a variável global está vazia)
    if (usuarioCadastrado == "") {
      _mostrarMensagem('Nenhum usuário cadastrado. Vá em "Cadastre-se" primeiro!');
      return;
    }

    // 3º FILTRO: Verifica se o que foi digitado bate com o que foi cadastrado
    if (usuarioDigitado == usuarioCadastrado && senhaDigitada == senhaCadastrada) {
      // SUCESSO! Navega para a próxima tela
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage(user: usuarioDigitado)),
      );
    } else {
      // ERRO: Dados não conferem
      _mostrarMensagem('Usuário ou senha incorretos!');
    }
  }

  // Função auxiliar para mostrar as mensagens (SnackBars) de forma limpa
  void _mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acesso ao Sistema")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bem-vindo! Faça o login para continuar.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _userController, 
              decoration: const InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passController, 
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Deixa o botão da largura da tela
              child: ElevatedButton(
                onPressed: _fazerLogin, 
                child: const Text("ENTRAR"),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const CadastroPage())
              ),
              child: const Text("Não tem conta? Cadastre-se aqui"),
            ),
          ],
        ),
      ),
    );
  }
}
