import 'package:cinetopia/models/filme_model.dart';
import 'package:flutter/material.dart';

class CardFilme extends StatelessWidget {
  const CardFilme(this.filme, {super.key, this.width});

  final FilmeModel filme;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          _imagem(),
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    filme.descricao,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Color(0xFFA5A5A5)),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagem() {
    final isPathInvalido =
        filme.pathImagem == null || filme.pathImagem!.isEmpty;
    return SizedBox(
      width: 90,
      height: 120,
      child: isPathInvalido ? _imagemPadrao() : _imagemInternet(),
    );
  }

  Widget _imagemPadrao() {
    return Image.asset('assets/images/popular.png', fit: BoxFit.cover);
  }

  Widget _imagemInternet() {
    return Image.network(
      filme.pathImagem!,
      fit: BoxFit.cover,
      loadingBuilder: _loadingBuilder,
    );
  }

  Widget _loadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    return loadingProgress == null
        ? child
        : _imagemCarregando(
            context,
            progresso: _calcularProgresso(loadingProgress),
          );
  }

  double _calcularProgresso(ImageChunkEvent loadingProgress) {
    final carregados = loadingProgress.cumulativeBytesLoaded;
    final total = loadingProgress.expectedTotalBytes ?? carregados;
    return carregados / total;
  }

  Widget _imagemCarregando(BuildContext context, {required double progresso}) {
    return Container(
      width: 90,
      height: 120,
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: CircularProgressIndicator(
          value: progresso,
          strokeWidth: 4.0,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
