import 'package:cinetopia/models/filme_model.dart';
import 'package:cinetopia/results/resultado.dart';
import 'package:cinetopia/services/listar_filmes_service.dart';
import 'package:flutter/material.dart';

class FilmesViewModel extends ChangeNotifier {
  final ListarFilmesService listarService;

  bool _isPesquisaAtiva = false;
  bool _isCarregando = true;

  final List<FilmeModel> todosFilmes = [];
  final List<FilmeModel> filmesFiltrados = [];
  String _erro = '';

  FilmesViewModel({ListarFilmesService? service})
    : listarService = service ?? ListarFilmesService();

  bool get isPesquisaAtiva => _isPesquisaAtiva;
  bool get isCarregando => _isCarregando;

  bool get hasErro => _erro.isNotEmpty;
  String? get erro => _erro;

  void ativarPesquisa() {
    _isPesquisaAtiva = true;
    notifyListeners();
  }

  void desativarPesquisa() {
    _isPesquisaAtiva = false;
    notifyListeners();
  }

  Future<void> carregarFilmes() async {
    _isCarregando = true;
    todosFilmes.clear();
    filmesFiltrados.clear();
    _erro = '';
    notifyListeners();

    final resultado = await listarService.listarFilmes().catchError((
      Object error,
    ) {
      return Resultado<List<FilmeModel>, String>.falha(
        'Erro ao carregar filmes: $error',
      );
    });

    resultado.fold<void>(
      onSucesso: (List<FilmeModel> filmes) {
        todosFilmes.addAll(filmes);
        filmesFiltrados.addAll(filmes);
      },
      onFalha: (String erro) {
        _erro = erro;
      },
    );

    _isCarregando = false;
    notifyListeners();
  }
}
