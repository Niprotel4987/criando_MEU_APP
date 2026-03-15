import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'preferencias_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Verifica se o usuário já existe para pular o login
  String? usuarioSalvo = await PreferenciasService.buscarUsuario();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Remove a faixa de debug
    home: usuarioSalvo != null 
        ? ProfilePage(user: usuarioSalvo) 
        : const LoginPage(),
  ));
}
