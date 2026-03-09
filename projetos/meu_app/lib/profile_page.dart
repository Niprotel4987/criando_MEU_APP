import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meu Perfil")),
      body: Center(child: Text("Olá, $user! Bem-vindo ao sistema.", style: const TextStyle(fontSize: 20))),
    );
  }
}