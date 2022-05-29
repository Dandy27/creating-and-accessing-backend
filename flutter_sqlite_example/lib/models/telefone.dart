import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;
  Telefone({
    required this.ddd,
    required this.telefone,
  });

//toMap() => é um método que pega o objeto(telefone) e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

//fromMap() -> é um construtor, ele vai pegar um Map e transformar em um objeto telefone
  factory Telefone.fromMap(Map<String, dynamic> map) => Telefone(
        ddd: map['ddd'] ?? 0,
        telefone: map['telefone'] ?? '',
      );

  //toJson() => é um método que retorna uma String do meu objeto Telefone
  String toJson() => jsonEncode(toMap());

  //fromJson() => é um método que baseado em uma string json retorna Telefone
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));

  @override
  String toString() => 'Telefone(ddd: $ddd, telefone: $telefone)';
}
