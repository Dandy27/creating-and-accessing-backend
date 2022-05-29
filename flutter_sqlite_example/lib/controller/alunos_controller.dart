import '../models/aluno.dart';
import '../models/cidade.dart';
import '../models/curso.dart';
import '../models/endereco.dart';
import '../models/telefone.dart';
import '../repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById('1');
    aluno.nomeCursos.add('Imersão Shelf');
    await _alunosRepository.update(aluno);
    final alunoAlterado = await _alunosRepository.findById('1');
    print(alunoAlterado.nome);
    print('Tem os Cursos');
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
        nome: 'Dandy Barbosa',
        nomeCursos: ['Academia do Flutter'],
        endereco: Endereco(
            rua: 'Nelson de Sousa ',
            numero: 326,
            cep: '13080260',
            cidade: Cidade(id: '1', nome: 'Campinas'),
            telefone: Telefone(ddd: 19, telefone: '981001723')),
        cursos: [
          Curso(id: 1, nome: 'Academia do Flutter', isAluno: true),
          Curso(id: 2, nome: 'Imersão GetX', isAluno: true)
        ]);
    _alunosRepository.insert(aluno);
  }
}
