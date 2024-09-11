import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livrosmaisvendidos/model/livros_model.dart';
import 'package:livrosmaisvendidos/service/livros_service.dart';

class LivrosController extends ChangeNotifier {
  final LivrosService _livrosService = LivrosService();
  List<Livro>? _livros;
  String? _mensagemErro;
  bool _estaCarregando = false;

  List<Livro>? get livros => _livros;
  String? get mensagemErro => _mensagemErro;
  bool get estaCarregando => _estaCarregando;

  Future<void> carregarLivrosMaisVendidos() async {
    _estaCarregando = true;
    notifyListeners();

    try {
      _livros = await _livrosService.obterLivrosMaisVendidos();
      _mensagemErro = null;
    } catch (e) {
      _mensagemErro = 'Erro: $e';
      _livros = null;
    } finally {
      _estaCarregando = false;
      notifyListeners();
    }
  }
}
