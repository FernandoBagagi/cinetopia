import 'package:cinetopia/viewmodels/filmes_view_model.dart';
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
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: viewModel.isPesquisaAtiva
            ? TextFormField(
                focusNode: pesquisarFocusNode,
                controller: pesquisaController,
                decoration: const InputDecoration(
                  hintText: 'Pesquisar ...',
                  border: InputBorder.none,
                ),
                onTapOutside: (PointerDownEvent _) {
                  pesquisarFocusNode.unfocus();
                  viewModel.desativarPesquisa();
                },
                onFieldSubmitted: (String value) {
                  pesquisarFocusNode.unfocus();
                  viewModel.desativarPesquisa();
                },
              )
            : const Text('Filmes populares'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              pesquisarFocusNode.requestFocus();
              viewModel.ativarPesquisa();
            },
          ),
        ],
      ),
      body: viewModel.isCarregando
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasErro
          ? Center(child: Text(viewModel.erro ?? 'Erro desconhecido'))
          : viewModel.filmesFiltrados.isEmpty
          ? const Center(child: Text('Nenhum filme encontrado'))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Center(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: _buildListaFilmes(),
                ),
              ),
            ),

      /*bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Ação ao selecionar um item
        },
      ),*/
    );
  }

  List<Widget> _buildListaFilmes() {
    return List.generate(viewModel.filmesFiltrados.length, (int index) {
      final filme = viewModel.filmesFiltrados[index];
      return Container(
        constraints: BoxConstraints(
          minHeight: 120.0,
          minWidth: 300.0 - 8.0,
          maxWidth: 600.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.0,
          children: [
            SizedBox(
              width: 90,
              height: 120,
              child: filme.pathImagem == null || filme.pathImagem!.isEmpty
                  ? Image.asset('assets/images/popular.png', fit: BoxFit.cover)
                  : Image.network(
                      filme.pathImagem!,
                      fit: BoxFit.cover,
                      loadingBuilder: _loadingBuilder,
                    ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    filme.titulo,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Text(filme.descricao,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Color(0xFFA5A5A5),
                    ),),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _loadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    return loadingProgress == null
        ? child
        : Container(
            width: 90,
            height: 120,
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            ),
          );
  }
}
