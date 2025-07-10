class Resultado<S, F> {

  final S? sucesso;
  final F? falha;

  final bool _isSucesso;

  const Resultado._({
    this.sucesso,
    this.falha,
    required bool isSucesso,
  }) : _isSucesso = isSucesso;

  factory Resultado.sucesso(S sucesso) {
    return Resultado._(sucesso: sucesso,isSucesso: true);
  }

  factory Resultado.falha(F falha) {
    return Resultado._(falha: falha, isSucesso: false);
  }

  bool get isSucesso => _isSucesso;

  bool get isFalha => !_isSucesso;

  T fold<T>({
    required T Function(S) onSucesso,
    required T Function(F) onFalha,
  }) {
    if (isSucesso) {
      return onSucesso(sucesso as S);
    } else {
      return onFalha(falha as F);
    }
  }

}