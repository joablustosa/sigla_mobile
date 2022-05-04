// ignore: file_names
// ignore_for_file: file_names

class Checklist {

  int? id;
  String? titulo;
  String? descricao;
  String? categoria;
  String? tipo;
  int? foto;
  int? obrigatorio;
  String? localVeiculo;
  int? idChecklist;
  double? idTripulante;
  String? imagem;

  Checklist(
      {this.id,
        this.titulo,
        this.descricao,
        this.categoria,
        this.tipo,
        this.foto,
        this.obrigatorio,
        this.localVeiculo,
        this.idChecklist,
        this.idTripulante,
        this.imagem
      }
  );

  Checklist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    categoria = json['categoria'];
    tipo = json['tipo'];
    foto = json['foto'];
    obrigatorio = json['obrigatorio'];
    localVeiculo = json['localVeiculo'];
    idChecklist = json['idChecklist'];
    idTripulante = json['idTripulante'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['categoria'] = this.categoria;
    data['tipo'] = this.tipo;
    data['foto'] = this.foto;
    data['obrigatorio'] = this.obrigatorio;
    data['localVeiculo'] = this.localVeiculo;
    data['idChecklist'] = this.idChecklist;
    data['idTripulante'] = this.idTripulante;
    data['imagem'] = this.imagem;
    return data;
  }
}