// ignore_for_file: file_names

class RankingTimeModel {
  String? matricula_motorista;
  String? nome_guerra;
  String? base_operacional;
  String? empresaMotorista;
  String? imagemMotorista;
  String? imagemTime;
  String? timeMotorista;
  num? eventos_operacoes;
  num? eventos_rh;
  num? eventos_manutencao;
  double? kml;
  double? metaKml;
  double? resultadoTrecho;
  double? pontoTrecho;
  double? kM;


  RankingTimeModel(
      {
        this.matricula_motorista,
        this.nome_guerra,
        this.base_operacional,
        this.empresaMotorista,
        this.imagemMotorista,
        this.imagemTime,
        this.timeMotorista,
        this.eventos_operacoes,
        this.eventos_rh,
        this.eventos_manutencao,
        this.kml,
        this.metaKml,
        this.resultadoTrecho,
        this.pontoTrecho,
        this.kM,
      }
    );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "matricula_motorista" : this.matricula_motorista,
      "nome_guerra" : this.nome_guerra,
      "base_operacional" : this.base_operacional,
      "EmpresaMotorista" : this.empresaMotorista,
      "ImagemMotorista" : this.imagemMotorista,
      "ImagemTime" : this.imagemTime,
      "TimeMotorista" : this.timeMotorista,
      "eventos_operacoes" : this.eventos_operacoes,
      "eventos_rh" : this.eventos_rh,
      "eventos_manutencao" : this.eventos_manutencao,
      "KML" : this.kml,
      "MetaKml" : this.metaKml,
      "resultadoTrecho" : this.resultadoTrecho,
      "PontoTrecho" : this.pontoTrecho,
      "KM" : this.kM,
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula_motorista'] = this.matricula_motorista;
    data['nome_guerra'] = this.nome_guerra;
    data['base_operacional'] = this.base_operacional;
    data['EmpresaMotorista'] = this.empresaMotorista;
    data['ImagemMotorista'] = this.imagemMotorista;
    data['ImagemTime'] = this.imagemTime;
    data['TimeMotorista'] = this.timeMotorista;
    data['eventos_operacoes'] = this.eventos_operacoes;
    data['eventos_rh'] = this.eventos_rh;
    data['eventos_manutencao'] = this.eventos_manutencao;
    data['KML'] = this.kml;
    data['MetaKml'] = this.metaKml;
    data['ResultadoTrecho'] = this.resultadoTrecho;
    data['PontoTrecho'] = this.pontoTrecho;
    data['KM'] = this.kM;
    return data;
  }

  RankingTimeModel.fromJson(Map<String, dynamic> json) {
    matricula_motorista = json['matricula_motorista'];
    nome_guerra = json['nome_guerra'];
    base_operacional = json['base_operacional'];
    empresaMotorista = json['empresaMotorista'];
    imagemMotorista = json['imagemMotorista'];
    imagemTime = json['imagemTime'];
    timeMotorista = json['timeMotorista'];
    eventos_operacoes = json['eventos_operacoes'];
    eventos_rh = json['eventos_rh'];
    eventos_manutencao = json['eventos_manutencao'];
    kml = json['kml'];
    metaKml = json['metaKml'];
    resultadoTrecho = json['resultadoGeral'];
    pontoTrecho = json['pontoTrecho'];
    kM = json['km'];
  }
}