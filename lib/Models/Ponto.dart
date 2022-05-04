// ignore_for_file: file_names

class Ponto {

  int? id;
  String? nome;
  String? cpf;
  String? matricula;
  String? evento;
  int? idEvento;
  DateTime? dataHoraEvento;
  String? motivoParada;
  int? idMotivoParada;
  String? tipoServico;
  String? origem;
  String? destino;
  String? veiculo;
  String? observacao;

  Ponto(
      {this.id,
        this.nome,
        this.cpf,
        this.matricula,
        this.evento,
        this.idEvento,
        this.dataHoraEvento,
        this.motivoParada,
        this.idMotivoParada,
        this.tipoServico,
        this.origem,
        this.destino,
        this.veiculo,
        this.observacao
      }
      );

  Ponto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    matricula = json['matricula'];
    evento = json['evento'];
    idEvento = json['idEvento'];
    dataHoraEvento = json['dataHoraEvento'];
    motivoParada = json['motivoParada'];
    idMotivoParada = json['idMotivoParada'];
    tipoServico = json['tipoServico'];
    origem = json['origem'];
    destino = json['destino'];
    veiculo = json['veiculo'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['matricula'] = this.matricula;
    data['evento'] = this.evento;
    data['dataHoraEvento'] = this.dataHoraEvento;
    data['motivoParada'] = this.motivoParada;
    data['tipoServico'] = this.tipoServico;
    data['origem'] = this.origem;
    data['destino'] = this.destino;
    data['veiculo'] = this.veiculo;
    data['observacao'] = this.observacao;
    return data;
  }
}