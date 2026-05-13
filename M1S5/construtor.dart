List<Map<String, dynamic>> alunos = [
  {"id": 98523488, "nome": "João da Silva", "telefone": null},
  {"id": 98523489, "nome": "Lucas Evangelista", "telefone": '11996541236'},
  {"id": 98523490, "nome": "Maria Teodoro", "telefone": '11944551236'},
  {"id": 98523491, "nome": "Isabel Santos", "telefone": null},
];

class Aluno {
  int id;
  String nome;
  String? telefone;

  Aluno(this.id, this.nome, [this.telefone]);

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(map["id"], map["nome"], map["telefone"] ?? 'S/N');
  }

  @override
  String toString() => "ID: $id | Nome: $nome | Telefone: $telefone";
}

void main() {
  //List<Aluno> alunosList = alunos.map((e) => Aluno(e["id"], e["nome"], e["telefone"] ?? 'S/N')).toList();
  List<Aluno> alunosList = alunos.map(Aluno.fromMap).toList();

  for (var aluno in alunosList) {
    print(aluno);
  }
}
