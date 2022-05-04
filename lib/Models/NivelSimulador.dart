
// ignore_for_file: file_names

class NivelSimulador {
  num? id;
  String? nome;
  String? tipo;
  String? responsavel;
  DateTime? dataCriacao;
  String? status;


  NivelSimulador({
    this.id,
    this.nome,
    this.tipo,
    this.responsavel,
    this.dataCriacao,
    this.status
  });

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "id" : this.id,
      "nome" : this.nome,
      "tipo" : this.tipo,
      "responsavel" : this.responsavel,
      "dataCriacao" : this.dataCriacao,
      "status" : this.status
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['responsavel'] = this.responsavel;
    data['dataCriacao'] = this.dataCriacao;
    data['status'] = this.status;
    return data;
  }

  NivelSimulador.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    responsavel = json['responsavel'];
    status = json['status'];
  }
}