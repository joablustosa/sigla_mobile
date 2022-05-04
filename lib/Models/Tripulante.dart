// ignore_for_file: file_names

class Tripulante {

  double? id;
  String? usuario;
  String? nome;
  String? flgaltera;
  double? sequencial;
  String? nomeguerra;
  double? cpf;
  String? telefone1;
  String? telefone2;
  String? telefone3;
  String? telefone4;
  String? telefone5;
  String? email;
  String? matricula;

  Tripulante(
      {this.id,
        this.usuario,
        this.nome,
        this.flgaltera,
        this.sequencial,
        this.nomeguerra,
        this.cpf,
        this.telefone1,
        this.telefone2,
        this.telefone3,
        this.telefone4,
        this.telefone5,
        this.email,
        this.matricula
      }
  );

  Tripulante.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    nome = json['nome'];
    flgaltera = json['flgaltera'];
    sequencial = json['sequencial'];
    nomeguerra = json['nomeguerra'];
    cpf = json['cpf'];
    telefone1 = json['telefone1'];
    telefone2 = json['telefone2'];
    telefone3 = json['telefone3'];
    telefone4 = json['telefone4'];
    telefone5 = json['telefone5'];
    email = json['email'];
    matricula = json['matricula'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario'] = this.usuario;
    data['nome'] = this.nome;
    data['flgaltera'] = this.flgaltera;
    data['sequencial'] = this.sequencial;
    data['nomeguerra'] = this.nomeguerra;
    data['cpf'] = this.telefone5;
    data['telefone1'] = this.telefone1;
    data['telefone2'] = this.telefone2;
    data['telefone3'] = this.telefone3;
    data['telefone4'] = this.telefone4;
    data['telefone5'] = this.telefone5;
    data['email'] = this.email;
    data['matricula'] = this.matricula;
    return data;
  }
}