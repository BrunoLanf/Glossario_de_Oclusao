class User {
  final String name;
  final String cod;
  final String turma;

  User(this.name, this.cod, this.turma);

  User.fromJson(Map<String, dynamic> json)
      : cod = json['cod'],
        name = json['name'],
        turma = json['turma'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cod': cod,
      'name': name,
      'turma': turma,
    };
  }
}
