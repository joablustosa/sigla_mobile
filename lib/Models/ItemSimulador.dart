
// ignore_for_file: file_names

class ItemSimulador {
  int? id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? opcao1;
  String? opcao2;
  String? opcao3;
  String? opcao4;
  String? resposta;
  double? ponto;
  int? idNivel;
  int? status;
  String? categoria;


  ItemSimulador({
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.opcao1,
    this.opcao2,
    this.opcao3,
    this.opcao4,
    this.resposta,
    this.ponto,
    this.idNivel,
    this.status,
    this.categoria
  });

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "id" : this.id,
      "titulo" : this.titulo,
      "descricao" : this.descricao,
      "imagem" : this.imagem,
      "opcao1" : this.opcao1,
      "opcao2" : this.opcao2,
      "opcao3" : this.opcao3,
      "resposta" : this.resposta,
      "ponto" : this.ponto,
      "idNivel" : this.idNivel,
      "status" : this.status,
      "categoria" : this.categoria
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    data['opcao1'] = this.opcao1;
    data['opcao2'] = this.opcao2;
    data['opcao3'] = this.opcao3;
    data['resposta'] = this.resposta;
    data['ponto'] = this.ponto;
    data['idNivel'] = this.idNivel;
    data['status'] = this.status;
    data['categoria'] = this.categoria;
    return data;
  }

  ItemSimulador.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagem = json['imagem'];
    opcao1 = json['opcao1'];
    opcao2 = json['opcao2'];
    opcao3 = json['opcao3'];
    resposta = json['resposta'];
    ponto = json['ponto'];
    idNivel = json['idNivel'];
    status = json['status'];
    categoria = json['categoria'];
  }
}