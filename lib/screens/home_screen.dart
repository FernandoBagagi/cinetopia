import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fundoDegrade(
        corComecoDegrade: Theme.of(context).colorScheme.onSecondary,
        corFimDegrade: Theme.of(context).colorScheme.surface,
        body: _body(),
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
          colors: [corComecoDegrade, corComecoDegrade],
        ),
      ),
      child: body,
    );
  }

  Widget _body() {
    return Placeholder();
  }
}
