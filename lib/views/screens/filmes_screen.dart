import 'package:cinetopia/viewmodels/filmes_view_model.dart';
import 'package:cinetopia/views/widgets/card_filme.dart';
import 'package:flutter/material.dart';

class FilmesScreen extends StatefulWidget {
  const FilmesScreen({super.key});

  @override
  State<FilmesScreen> createState() => _FilmesScreenState();
}

class _FilmesScreenState extends State<FilmesScreen> {
  late final FilmesViewModel viewModel;
  late final FocusNode pesquisarFocusNode;
  late final TextEditingController pesquisaController;

  @override
  void initState() {
    super.initState();
    pesquisarFocusNode = FocusNode();
    pesquisaController = TextEditingController();
    viewModel = FilmesViewModel();
    viewModel.addListener(_screenListener);
    viewModel.carregarFilmes();
  }

  void _screenListener() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    viewModel.removeListener(_screenListener);
    pesquisaController.dispose();
    pesquisarFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: const Icon(Icons.arrow_back),
      centerTitle: true,
      title: viewModel.isPesquisaAtiva
          ? _campoPesquisa()
          : const Text('Filmes populares'),
      actions: [_botaoPesquisa()],
    );
  }

  Widget _campoPesquisa() {
    return TextFormField(
      focusNode: pesquisarFocusNode,
      controller: pesquisaController,
      decoration: const InputDecoration(
        hintText: 'Pesquisar ...',
        border: InputBorder.none,
      ),
      onTapOutside: (PointerDownEvent _) {
        _fecharPesquisa();
      },
      onFieldSubmitted: (String _) {
        _fecharPesquisa();
      },
    );
  }

  void _fecharPesquisa() {
    pesquisarFocusNode.unfocus();
    viewModel.desativarPesquisa();
  }

  IconButton _botaoPesquisa() {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        pesquisarFocusNode.requestFocus();
        viewModel.ativarPesquisa();
      },
    );
  }

  Widget _body() {
    return viewModel.isCarregando
        ? const Center(child: CircularProgressIndicator())
        : viewModel.hasErro
        ? Center(child: Text(viewModel.erro ?? 'Erro desconhecido'))
        : viewModel.filmesFiltrados.isEmpty
        ? const Center(child: Text('Nenhum filme encontrado'))
        : _wrapFilmes();
  }

  Widget _wrapFilmes() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double maxWidth = constraints.maxWidth;
          const minCardWidth = 450.0;
          int cardsPerRow = (maxWidth / minCardWidth).floor();
          double cardWidth = (maxWidth / cardsPerRow);

          Widget cardFilmeListGenerator(int index) {
            final filme = viewModel.filmesFiltrados[index];
            return CardFilme(filme, width: cardWidth - 16.0);
          }

          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              viewModel.filmesFiltrados.length,
              cardFilmeListGenerator,
            ),
          );
        },
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: _buildItemsBottomNavigationBar,
      currentIndex: 0,
      onTap: _onTapItemBottomNavigationBar,
    );
  }

  List<BottomNavigationBarItem> get _buildItemsBottomNavigationBar {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Configurações',
      ),
    ];
  }

  void _onTapItemBottomNavigationBar(int index) {}
}
