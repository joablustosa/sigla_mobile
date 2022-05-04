// ignore: file_names
// ignore_for_file: file_names

class ContatoEmpresaModel {

  int? id;
  String? contatoSetor;
  String? numeroContato;
  String? responsavel;
  String? funcionamento;

  ContatoEmpresaModel(
      {this.id,
        this.contatoSetor,
        this.numeroContato,
        this.responsavel,
        this.funcionamento
      }
  );

  ContatoEmpresaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contatoSetor = json['contatoSetor'];
    numeroContato = json['numeroContato'];
    responsavel = json['responsavel'];
    funcionamento = json['funcionamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contatoSetor'] = this.contatoSetor;
    data['numeroContato'] = this.numeroContato;
    data['responsavel'] = this.responsavel;
    data['funcionamento'] = this.funcionamento;
    return data;
  }
}