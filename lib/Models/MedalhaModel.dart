// ignore_for_file: file_names

class MedalhaModel {
  String? MatriculaMotorista;
  String? NomeGuerra;
  String? NomeMedalha;
  String? ImgMedalha;
  String? DataPremio;


  MedalhaModel(
      {
        this.MatriculaMotorista,
        this.NomeGuerra,
        this.NomeMedalha,
        this.ImgMedalha,
        this.DataPremio
      }
    );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "matriculaMotorista" : this.MatriculaMotorista,
      "nomeGuerra" : this.NomeGuerra,
      "nomeMedalha" : this.NomeMedalha,
      "imgMedalha" : this.ImgMedalha,
      "dataPremio" : this.DataPremio,
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matriculaMotorista'] = this.MatriculaMotorista;
    data['nomeGuerra'] = this.NomeGuerra;
    data['nomeMedalha'] = this.NomeMedalha;
    data['imgMedalha'] = this.ImgMedalha;
    data['dataPremio'] = this.DataPremio;
    return data;
  }

  MedalhaModel.fromJson(Map<String, dynamic> json) {
    MatriculaMotorista = json['matriculaMotorista'];
    NomeGuerra = json['nomeGuerra'];
    NomeMedalha = json['nomeMedalha'];
    ImgMedalha = json['imgMedalha'];
    DataPremio = json['dataPremio'];
  }
}