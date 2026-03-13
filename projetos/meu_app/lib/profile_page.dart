import 'package:flutter/material.dart';
import 'preferencias_service.dart'; // Para limpar o login
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Um ícone de avatar para dar um charme
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                "Bem-vindo, $user!",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Você está logado no sistema.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 50),
              
              // BOTÃO DE LOGOUT ESTILIZADO
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // 1. Limpa o nome salvo no celular (Permanentemente)
                    await PreferenciasService.limpar();
                    
                    // 2. Volta para a tela de login removendo todas as telas anteriores
                    if (!context.mounted) return;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text("SAIR DO APP", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Cor de alerta
                    elevation: 5, // Sombra
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}