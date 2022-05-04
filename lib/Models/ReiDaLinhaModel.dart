// ignore_for_file: file_names

class ReiDaLinhaModel {
  String? nome_origem;
  String? nome_destino;
  String? nome_guerra;
  String? matricula_motorista;
  double? kml;
  String? imagemMotorista;
  String? imagemTime;


  ReiDaLinhaModel(
      {
        this.nome_origem,
        this.nome_destino,
        this.nome_guerra,
        this.matricula_motorista,
        this.kml,
        this.imagemMotorista,
        this.imagemTime,
      }
    );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome_origem" : this.nome_origem,
      "nome_destino" : this.nome_destino,
      "nome_guerra" : this.nome_guerra,
      "matricula_motorista" : this.matricula_motorista,
      "kml" : this.kml,
      "imagemMotorista" : this.imagemMotorista,
      "imagemTime" : this.imagemTime,
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome_origem'] = this.nome_origem;
    data['nome_destino'] = this.nome_destino;
    data['nome_guerra'] = this.nome_guerra;
    data['matricula_motorista'] = this.matricula_motorista;
    data['kml'] = this.kml;
    data['imagemMotorista'] = this.imagemMotorista;
    data['imagemTime'] = this.imagemTime;
    return data;
  }

  ReiDaLinhaModel.fromJson(Map<String, dynamic> json) {
    nome_origem = json['nome_origem'];
    nome_destino = json['nome_destino'];
    nome_guerra = json['nome_guerra'];
    matricula_motorista = json['matricula_motorista'];
    kml = json['kml'];
    imagemMotorista = json['imagemMotorista'];
    imagemTime = json['imagemTime'];
  }
}