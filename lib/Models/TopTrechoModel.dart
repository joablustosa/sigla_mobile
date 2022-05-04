// ignore_for_file: file_names

class TopTrechoModel {
  String? partida_realizada;
  String? chegada_realizada;
  String? matricula_motorista;
  String? nome_guerra;
  String? nome_destino;
  String? base_operacional;
  String? EmpresaMotorista;
  String? ImagemMotorista;
  String? ImagemTime;
  String? TimeMotorista;
  double? kml;
  num? eventos_operacoes;
  num? eventos_rh;
  num? eventos_manutencao;
  String? Prefixo;
  String? sigla_origem;
  String? sigla_destino;
  double? MetaKml;
  double? ResultadoTrecho;
  double? PontoTrecho;
  double? KM;


  TopTrechoModel(
      {
        this.partida_realizada,
        this.chegada_realizada,
        this.matricula_motorista,
        this.nome_guerra,
        this.nome_destino,
        this.base_operacional,
        this.EmpresaMotorista,
        this.ImagemMotorista,
        this.ImagemTime,
        this.TimeMotorista,
        this.kml,
        this.eventos_operacoes,
        this.eventos_rh,
        this.eventos_manutencao,
        this.Prefixo,
        this.sigla_origem,
        this.sigla_destino,
        this.MetaKml,
        this.ResultadoTrecho,
        this.PontoTrecho,
        this.KM,
      }
    );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "partida_realizada" : this.partida_realizada,
      "chegada_realizada" : this.chegada_realizada,
      "matricula_motorista" : this.matricula_motorista,
      "nome_guerra" : this.nome_guerra,
      "nome_destino" : this.nome_destino,
      "base_operacional" : this.base_operacional,
      "EmpresaMotorista" : this.EmpresaMotorista,
      "ImagemMotorista" : this.ImagemMotorista,
      "ImagemTime" : this.ImagemTime,
      "TimeMotorista" : this.TimeMotorista,
      "KML" : this.kml,
      "eventos_operacoes" : this.eventos_operacoes,
      "eventos_rh" : this.eventos_rh,
      "eventos_manutencao" : this.eventos_manutencao,
      "Prefixo" : this.Prefixo,
      "sigla_origem" : this.sigla_origem,
      "sigla_destino" : this.sigla_destino,
      "MetaKml" : this.MetaKml,
      "ResultadoTrecho" : this.ResultadoTrecho,
      "PontoTrecho" : this.PontoTrecho,
      "KM" : this.KM,
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partida_realizada'] = this.partida_realizada;
    data['chegada_realizada'] = this.chegada_realizada;
    data['matricula_motorista'] = this.matricula_motorista;
    data['nome_guerra'] = this.nome_guerra;
    data['nome_destino'] = this.nome_destino;
    data['base_operacional'] = this.base_operacional;
    data['EmpresaMotorista'] = this.EmpresaMotorista;
    data['ImagemMotorista'] = this.ImagemMotorista;
    data['ImagemTime'] = this.ImagemTime;
    data['TimeMotorista'] = this.TimeMotorista;
    data['KML'] = this.kml;
    data['eventos_operacoes'] = this.eventos_operacoes;
    data['eventos_rh'] = this.eventos_rh;
    data['eventos_manutencao'] = this.eventos_manutencao;
    data['Prefixo'] = this.Prefixo;
    data['sigla_origem'] = this.sigla_origem;
    data['sigla_destino'] = this.sigla_destino;
    data['MetaKml'] = this.MetaKml;
    data['ResultadoTrecho'] = this.ResultadoTrecho;
    data['PontoTrecho'] = this.PontoTrecho;
    data['KM'] = this.KM;
    return data;
  }

  TopTrechoModel.fromJson(Map<String, dynamic> json) {
    partida_realizada = json['partida_realizada'];
    chegada_realizada = json['chegada_realizada'];
    matricula_motorista = json['matricula_motorista'];
    nome_guerra = json['nome_guerra'];
    nome_destino = json['nome_destino'];
    base_operacional = json['base_operacional'];
    EmpresaMotorista = json['empresaMotorista'];
    ImagemMotorista = json['imagemMotorista'];
    ImagemTime = json['imagemTime'];
    TimeMotorista = json['timeMotorista'];
    kml = json['kml'];
    eventos_operacoes = json['eventos_operacoes'];
    eventos_rh = json['eventos_rh'];
    eventos_manutencao = json['eventos_manutencao'];
    Prefixo = json['Prefixo'];
    sigla_origem = json['sigla_origem'];
    sigla_destino = json['sigla_destino'];
    MetaKml = json['metaKml'];
    ResultadoTrecho = json['resultadoTrecho'];
    PontoTrecho = json['pontoTrecho'];
    KM = json['km'];
  }
}