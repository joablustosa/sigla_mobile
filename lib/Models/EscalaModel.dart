// ignore_for_file: file_names

class EscalaModel {
  double? secjornada;
  String? matricula;
  String? nome;
  String? nomeguerra;
  //DateTime
  String? dtjornada;
  String? flgestado;
  double? seqprogramacao;
  String? flgtipo;
  String? servico;
  String? codredlinha;
  String? codlinha;
  String? codiataorig;
  String? codiatadest;
  //DateTime
  String? partidaprev;
  //DateTime
  String? chegadaprev;
  String? codatividade;
  String? codiataatividade;
  //DateTime
  String? dthrinicio;
  //DateTime
  String? dthrfim;
  String? observacao_jornada;
  String? observacao_programacao;
  String? codfuncaobordo;
  //DateTime
  String? c_apresentacao;
  String? prefixo;


  EscalaModel(
      {this.secjornada,
        this.matricula,
        this.nome,
        this.nomeguerra,
        this.dtjornada,
        this.flgestado,
        this.seqprogramacao,
        this.flgtipo,
        this.servico,
        this.codredlinha,
        this.codlinha,
        this.codiataorig,
        this.codiatadest,
        this.partidaprev,
        this.chegadaprev,
        this.codatividade,
        this.codiataatividade,
        this.dthrinicio,
        this.dthrfim,
        this.observacao_jornada,
        this.observacao_programacao,
        this.codfuncaobordo,
        this.prefixo,
        this.c_apresentacao
      }
      );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "secjornada" : this.secjornada,
      "matricula" : this.matricula,
      "nome" : this.nome,
      "nomeguerra" : this.nomeguerra,
      "dtjornada" : this.dtjornada,
      "flgestado" : this.flgestado,
      "seqprogramacao" : this.seqprogramacao,
      "flgtipo" : this.flgtipo,
      "servico" : this.servico,
      "codredlinha" : this.codredlinha,
      "codlinha" : this.codlinha,
      "codiataorig" : this.codiataorig,
      "codiatadest" : this.codiatadest,
      "partidaprev" : this.partidaprev,
      "chegadaprev" : this.chegadaprev,
      "codatividade" : this.codatividade,
      "codiataatividade" : this.codiataatividade,
      "dthrinicio" : this.dthrinicio,
      "dthrfim" : this.dthrfim,
      "observacao_jornada" : this.observacao_jornada,
      "observacao_programacao" : this.observacao_programacao,
      "codfuncaobordo" : this.codfuncaobordo,
      "c_apresentacao" : this.c_apresentacao,
      "prefixo" : this.prefixo
    };
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secjornada'] = this.secjornada;
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    data['nomeguerra'] = this.nomeguerra;
    data['dtjornada'] = this.dtjornada;
    data['flgestado'] = this.flgestado;
    data['seqprogramacao'] = this.seqprogramacao;
    data['flgtipo'] = this.flgtipo;
    data['servico'] = this.servico;
    data['codredlinha'] = this.codredlinha;
    data['codlinha'] = this.codlinha;
    data['codiataorig'] = this.codiataorig;
    data['codiatadest'] = this.codiatadest;
    data['partidaprev'] = this.partidaprev;
    data['chegadaprev'] = this.chegadaprev;
    data['codatividade'] = this.codatividade;
    data['codiataatividade'] = this.codiataatividade;
    data['dthrinicio'] = this.dthrinicio;
    data['dthrfim'] = this.dthrfim;
    data['observacao_jornada'] = this.observacao_jornada;
    data['observacao_programacao'] = this.observacao_programacao;
    data['codfuncaobordo'] = this.codfuncaobordo;
    data['c_apresentacao'] = this.c_apresentacao;
    data['prefixo'] = this.prefixo;
    return data;
  }

  EscalaModel.fromJson(Map<String, dynamic> json) {
    secjornada = json['secjornada'];
    matricula = json['matricula'];
    nome = json['nome'];
    nomeguerra = json['nomeguerra'];
    dtjornada = json['dtjornada'];
    flgestado = json['flgestado'];
    seqprogramacao = json['seqprogramacao'];
    flgtipo = json['flgtipo'];
    servico = json['servico'];
    codredlinha = json['codredlinha'];
    codlinha = json['codlinha'];
    codiataorig = json['codiataorig'];
    codiatadest = json['codiatadest'];
    partidaprev = json['partidaprev'];
    chegadaprev = json['chegadaprev'];
    codatividade = json['codatividade'];
    codiataatividade = json['codiataatividade'];
    dthrinicio = json['dthrinicio'];
    dthrfim = json['dthrfim'];
    observacao_jornada = json['observacao_jornada'];
    observacao_programacao = json['observacao_programacao'];
    codfuncaobordo = json['codfuncaobordo'];
    c_apresentacao = json['c_apresentacao'];
    prefixo = json['prefixo'];
  }
}