import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fundoDegrade(
        corComecoDegrade: Theme.of(context).colorScheme.onSecondary,
        corFimDegrade: Theme.of(context).colorScheme.surface,
        body: _body(context),
      ),
    );
  }

  Widget _fundoDegrade({
    required Color corComecoDegrade,
    required Color corFimDegrade,
    required Widget body,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [corComecoDegrade, corFimDegrade],
        ),
      ),
      child: body,
    );
  }

  Widget _body(BuildContext context) {
    Widget builderBodyContent(BuildContext _, BoxConstraints constraints) {
      return _builderBodyContent(context, constraints);
    }

    return SafeArea(
      child: Center(child: LayoutBuilder(builder: builderBodyContent)),
    );
  }

  Widget _builderBodyContent(BuildContext context, BoxConstraints constraints) {
    return Container(
      constraints: BoxConstraints(maxWidth: 600.0),
      padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 20.0),
      child: _buildBodyContent(context, boxConstraints: constraints),
    );
  }

  Widget _buildBodyContent(
    BuildContext context, {
    required BoxConstraints boxConstraints,
  }) {
    return SingleChildScrollView(
      child: Column(
        spacing: 24.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImagem(
            context,
            path: 'assets/images/logo.png',
            larguraMaxima: boxConstraints.maxWidth * 0.5,
          ),
          _buildImagem(
            context,
            path: 'assets/images/splash.png',
            decimalPorcentagem: 0.34,
            alturaMinima: 40.0,
            alturaMaxima: 500.0,
          ),
          _buildTexto(),
          _buildBotao(context),
        ],
      ),
    );
  }

  Widget _buildImagem(
    BuildContext context, {
    double decimalPorcentagem = 0.12,
    double alturaMinima = 20.0,
    double alturaMaxima = 200.0,
    double larguraMaxima = double.infinity,
    required path,
  }) {
    return Container(
      constraints: BoxConstraints(
        minHeight: alturaMinima,
        maxHeight: _calcularAlturaMaxImagem(
          context: context,
          decimalPorcentagem: decimalPorcentagem,
          alturaMinima: alturaMinima,
          alturaMaxima: alturaMaxima,
        ),
      ),

      child: Image.asset(path, width: larguraMaxima, fit: BoxFit.contain),
    );
  }

  double _calcularAlturaMaxImagem({
    required BuildContext context,
    required double decimalPorcentagem,
    double alturaMinima = 20.0,
    double alturaMaxima = 300.0,
  }) {
    final height = MediaQuery.of(context).size.height * decimalPorcentagem;
    if (height < alturaMinima) return alturaMinima;
    if (height > alturaMaxima) return alturaMaxima;
    return height;
  }

  Widget _buildTexto() {
    return Text(
      'O lugar ideal para buscar, salvar e organizar seus filmes favoritos!',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBotao(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              'Quero começar!',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          Icon(Icons.arrow_forward, size: 28.0, weight: 700.0),
        ],
      ),
    );
  }
}
