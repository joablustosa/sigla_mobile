// ignore: file_names
// ignore_for_file: file_names

import 'package:sigla_mobile/Models/Checklist.dart';

class ChecklistItem {

  int? id;
  int? idItem;
  DateTime? dataHora;
  double? seqJornada;
  int? resultado;
  String? observacao;
  String? foto;

  ChecklistItem(
      {this.id,
        this.idItem,
        this.dataHora,
        this.seqJornada,
        this.resultado,
        this.observacao,
        this.foto
      }
  );

  ChecklistItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idItem = json['idItem'];
    dataHora = json['dataHora'];
    seqJornada = json['seqJornada'];
    resultado = json['resultado'];
    observacao = json['observacao'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idItem'] = this.idItem;
    data['dataHora'] = this.dataHora;
    data['seqJornada'] = this.seqJornada;
    data['resultado'] = this.resultado;
    data['observacao'] = this.observacao;
    data['foto'] = this.foto;
    return data;
  }
}