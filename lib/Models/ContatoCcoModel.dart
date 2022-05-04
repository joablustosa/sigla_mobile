// ignore: file_names
// ignore_for_file: file_names

class ContatoCcoModel {

  int? id;
  String? titulo;
  String? mensagem;
  DateTime? dataCriacao;
  double? seqTripulante;

  ContatoCcoModel(
      {
        this.id,
        this.titulo,
        this.mensagem,
        this.dataCriacao,
        this.seqTripulante
      }
  );

  ContatoCcoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    mensagem = json['mensagem'];
    dataCriacao = json['dataCriacao'];
    seqTripulante = json['seqTripulante'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['mensagem'] = this.mensagem;
    data['dataCriacao'] = this.dataCriacao;
    data['seqTripulante'] = this.seqTripulante;
    return data;
  }
}