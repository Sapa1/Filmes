class Filme {
  String nome;

  Filme.fromJson(Map <String, dynamic> json) {
    nome = json['title'];
  }
}