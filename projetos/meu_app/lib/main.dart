import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'preferencias_service.dart'; // Importamos o nosso novo serviço

void main() async {
  // 1. Garantir que os serviços do Flutter estejam prontos antes de iniciar
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Verificar se já existe um usuário salvo na memória do celular
  String? usuarioSalvo = await PreferenciasService.buscarUsuario();

  runApp(MaterialApp(
    // 3. Lógica do Porteiro: 
    // Se usuarioSalvo não for nulo, abre direto o ProfilePage.
    // Se for nulo, abre a LoginPage.
    home: usuarioSalvo != null 
        ? ProfilePage(user: usuarioSalvo) 
        : const LoginPage(),
  ));
}