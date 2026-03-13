import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasService {
  // Salva o nome do usuário
  static Future<void> salvarUsuario(String nome) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuario_nome', nome);
  }

  // Recupera o nome do usuário
  static Future<String?> buscarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('usuario_nome');
  }

  // Limpa os dados (Logout)
  static Future<void> limpar() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuario_nome');
  }
}