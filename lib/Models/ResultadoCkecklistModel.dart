// ignore_for_file: file_names

class ResultadoCkecklistModel {

  int? id;
  int? idItem;
  double? seqJornada;
  int? resultado;
  String? observacao;
  String? foto;
  DateTime? dataHora;

  ResultadoCkecklistModel(
      {
        this.id,
        this.idItem,
        this.seqJornada,
        this.resultado,
        this.observacao,
        this.foto,
        this.dataHora,
      }
  );

  ResultadoCkecklistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idItem = json['idItem'];
    seqJornada = json['seqJornada'];
    resultado = json['resultado'];
    observacao = json['observacao'];
    dataHora = json['dataHora'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idItem'] = this.idItem;
    data['seqJornada'] = this.seqJornada;
    data['resultado'] = this.resultado;
    data['observacao'] = this.observacao;
    data['dataHora'] = this.dataHora;
    return data;
  }
}