import 'dart:convert';

class Curso {
  int id;
  String nome;
  bool isAluno;
  Curso({
    required this.id,
    required this.nome,
    required this.isAluno,
  });

  //toMap() => é um método que pega um objeto(Curso) e trandforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
        'isAluno': isAluno,
      };

  //fromMap() => é um método que pega um objeto(Curso) e transforma em um objeto (Curso)
  factory Curso.fromMap(Map<String, dynamic> map) => Curso(
        id: map['id'] ?? 0,
        nome: map['nome'] ?? '',
        isAluno: map['isAluno'] ?? false,
      );

  //toJson() => é um método que retorna uma String do meu objeto(Curso)
  String toJson() => jsonEncode(toMap());

  //fromJson() => é um método que baseado em uma String json retorna um (Curso)
  factory Curso.fromJson(String json) => Curso.fromMap(jsonDecode(json));

  @override
  String toString() => 'Curso(id: $id, nome: $nome, isAluno: $isAluno)';
}
