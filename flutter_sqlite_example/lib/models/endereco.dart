import 'dart:convert';

import 'cidade.dart';
import 'telefone.dart';

class Endereco {
  String rua;
  int numero;
  String cep;
  Cidade cidade;
  Telefone telefone;
  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });

  //toMap() => é um método que pega um objeto (Endereço) e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() => {
        'rua': rua,
        'numero': numero,
        'CEP': cep,
        'cidade': cidade.toMap(),
        'telefone': telefone.toMap(),
      };

  //fromMap() => é um construtor, ele vai pegar um Map e transformar em um objeto (Endereço)
  factory Endereco.fromMap(Map<String, dynamic> map) => Endereco(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      cep: map['CEP'] ?? '',
      cidade: Cidade.fromMap(map['cidade']),
      telefone: Telefone.fromMap(map['telefone']));

  //toJson() é um metodo que retorna uma String do meu objeto (Endereço)
  String toJson() => jsonEncode(toMap());

  //fromJson() => é um método que baseado em uma String json retorna um Endereço
  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Endereco(rua: $rua, numero: $numero, cep: $cep, cidade: $cidade, telefone: $telefone)';
  }
}
