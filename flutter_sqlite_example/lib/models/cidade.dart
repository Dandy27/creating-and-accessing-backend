import 'dart:convert';

class Cidade {
  String id;
  String nome;
  Cidade({
    required this.id,
    required this.nome,
  });
  //toMap () => é um método que pega o objeto(Cidade) e transforma em um Map
  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
      };

//fromMap() => é um construtor, ele pega um map e transforma em um ojeto Cidade
  factory Cidade.fromMap(Map<String, dynamic> map) => Cidade(
        id: map['id'] ?? 0,
        nome: map['nome'] ?? '',
      );

//toJson() => é uma string que retorna uma String do meu objeto Cidade,
  String toJson() => jsonEncode(toMap());

//fromJson() => é um método que baseado em uma string json retorna Cidade
  factory Cidade.fromJson(String json) => Cidade.fromMap(
        jsonDecode(json),
      );

  @override
  String toString() => 'Cidade(id: $id, nome: $nome)';
}
