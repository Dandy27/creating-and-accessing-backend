import 'dart:convert';

import 'curso.dart';
import 'endereco.dart';

class Aluno {
  String? id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  Endereco endereco;
  List<Curso> cursos;
  Aluno({
     this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.endereco,
    required this.cursos,
  });

  //toMap() => é um método que pega um objeto (Aluno) e transforma em um Map<String,dynamic>
  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
        'idade': idade,
        'nomeCursos': nomeCursos,
        'endereco': endereco.toMap(),
        'cursos': cursos.map((curso) => curso.toMap()).toList(),
      };

  //fromMap() => é um construtor, ele vai pegar um Map e transformar em  em um Objeto(Aluno)
  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
        id: map['id'] ?? '',
        nome: map['nome'] ?? '',
        idade: map['idade'],
        // nomeCursos: List<String>.from(map['nomeCursos']),
        nomeCursos: (map['nomeCursos'].cast<String>()),
        endereco: Endereco.fromMap(map['endereco'] ?? ''),
        cursos: map['cursos']
            .map<Curso>((cursoMap) => Curso.fromMap(cursoMap))
            .toList(),
      );
  }

  //toJson() => é um método que retorna uma String do meu objeto(Curso)
  String toJson() => jsonEncode(toMap());

  //fromJson() => é um método que baseado em uma String json que retorna Curso
  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, idade: $idade, nomeCursos: $nomeCursos, endereco: $endereco, cursos: $cursos)';
  }
}
