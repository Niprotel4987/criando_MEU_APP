import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasService {
  // Salva nome e senha
  static Future<void> salvarDados(String nome, String senha) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuario_nome', nome);
    await prefs.setString('usuario_senha', senha);
  }

  // Busca os dados (usado no pular login e no carregar credenciais)
  static Future<Map<String, String?>> buscarDados() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'nome': prefs.getString('usuario_nome'),
      'senha': prefs.getString('usuario_senha'),
    };
  }

  // Método auxiliar que você usou no main.dart
  static Future<String?> buscarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('usuario_nome');
  }

  static Future<void> limpar() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}