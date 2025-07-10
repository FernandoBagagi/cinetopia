import 'dart:convert';

class FilmeModel {
  final String id;
  final String titulo;
  final String descricao;
  final String? pathImagem;
  final List<String> generos;

  const FilmeModel({
    required this.id,
    String? titulo,
    String? descricao,
    this.pathImagem,
    List<String>? generos,
  }) : titulo = titulo ?? 'Sem Título',
       descricao = descricao ?? '',
       generos = generos ?? const [];

  factory FilmeModel.fromMap(Map<String, dynamic> map) {
    return FilmeModel(
      id: map['id'] as String,
      titulo: map['titulo'] as String?,
      descricao: map['descricao'] as String?,
      pathImagem: map['pathImagem'] as String?,
      generos: List<String>.from(map['generos'] ?? []),
    );
  }

  factory FilmeModel.fromJson(String json) {
    return FilmeModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'pathImagem': pathImagem,
      'generos': generos,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  @override
  String toString() => 'FilmeModel = ${toMap()}';

  @override
  int get hashCode {
    return Object.hash(
      id,
      titulo,
      descricao,
      pathImagem,
      Object.hashAll(generos),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is FilmeModel && runtimeType == other.runtimeType) {
      return id == other.id &&
          titulo == other.titulo &&
          descricao == other.descricao &&
          pathImagem == other.pathImagem &&
          _isGenerosIdenticos(other.generos);
    }
    return false;
  }

  bool _isGenerosIdenticos(List<String> otherGeneros) {
    if (generos.length != otherGeneros.length) return false;
    for (int i = 0; i < generos.length; i++) {
      if (generos[i] != otherGeneros[i]) return false;
    }
    return true;
  }
}
