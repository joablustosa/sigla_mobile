// ignore_for_file: file_names

class PerfilModel {
  String? matricula_motorista;
  String? nome_guerra;
  String? base_operacional;
  String? empresaMotorista;
  String? imagemMotorista;
  String? imagemTime;
  String? timeMotorista;
  double? kml;
  String? ImagemTime;
  String? TimeMotorista;
  num? eventos_operacoes;
  num? eventos_rh;
  num? eventos_manutencao;
  double? MetaKml;
  double? ResultadoTrecho;
  double? PontoTrecho;
  double? KM;

  PerfilModel(
      {
        this.matricula_motorista,
        this.nome_guerra,
        this.base_operacional,
        this.empresaMotorista,
        this.imagemMotorista,
        this.imagemTime,
        this.timeMotorista,
        this.kml,
        this.ImagemTime,
        this.TimeMotorista,
        this.eventos_operacoes,
        this.eventos_rh,
        this.eventos_manutencao,
        this.MetaKml,
        this.ResultadoTrecho,
        this.PontoTrecho,
        this.KM
      }
      );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "matricula_motorista" : this.matricula_motorista,
      "nome_guerra" : this.nome_guerra,
      "base_operacional" : this.base_operacional,
      "empresaMotorista" : this.empresaMotorista,
      "imagemMotorista" : this.imagemMotorista,
      "imagemTime" : this.imagemTime,
      "timeMotorista" : this.timeMotorista,
      "kml" : this.kml,
      "ImagemTime" : this.ImagemTime,
      "TimeMotorista" : this.TimeMotorista,
      "eventos_operacoes" : this.eventos_operacoes,
      "eventos_rh" : this.eventos_rh,
      "eventos_manutencao" : this.eventos_manutencao,
      "MetaKml" : this.MetaKml,
      "resultadoTrecho" : this.ResultadoTrecho,
      "pontoTrecho" : this.PontoTrecho,
      "km" : this.KM
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula_motorista'] = this.matricula_motorista;
    data['nome_guerra'] = this.nome_guerra;
    data['base_operacional'] = this.base_operacional;
    data['empresaMotorista'] = this.empresaMotorista;
    data['imagemMotorista'] = this.imagemMotorista;
    data['imagemTime'] = this.imagemTime;
    data['timeMotorista'] = this.timeMotorista;
    data['kml'] = this.kml;
    data['imagemTime'] = this.ImagemTime;
    data['timeMotorista'] = this.TimeMotorista;
    data['eventos_operacoes'] = this.eventos_operacoes;
    data['eventos_rh'] = this.eventos_rh;
    data['eventos_manutencao'] = this.eventos_manutencao;
    return data;
  }

  PerfilModel.fromJson(Map<String, dynamic> json) {
    matricula_motorista = json['matricula_motorista'];
    nome_guerra = json['nome_guerra'];
    base_operacional = json['base_operacional'];
    empresaMotorista = json['empresaMotorista'];
    imagemMotorista = json['imagemMotorista'];
    imagemTime = json['imagemTime'];
    timeMotorista = json['timeMotorista'];
    kml = json['kml'];
    ImagemTime = json['imagemTime'];
    TimeMotorista = json['timeMotorista'];
    eventos_operacoes = json['eventos_operacoes'];
    eventos_rh = json['eventos_rh'];
    eventos_manutencao = json['eventos_manutencao'];
    MetaKml = json['metaKml'];
    ResultadoTrecho = json['resultadoGeral'];
    PontoTrecho = json['pontoTrecho'];
    KM = json['km'];
  }
}