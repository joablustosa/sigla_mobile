// ignore_for_file: file_names

class ResultadoSimulador {

  int? id;
  int? idPergunta;
  double? seqTripulante;
  int? nivel;
  int? resposta;
  double? ponto;
  int? dataHora;

  ResultadoSimulador(
      {
        this.id,
        this.idPergunta,
        this.seqTripulante,
        this.nivel,
        this.resposta,
        this.ponto,
        this.dataHora,
      }
  );

  ResultadoSimulador.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPergunta = json['idPergunta'];
    seqTripulante = json['seqTripulante'];
    nivel = json['nivel'];
    ponto = json['ponto'];
    dataHora = json['dataHora'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idPergunta'] = this.idPergunta;
    data['seqTripulante'] = this.seqTripulante;
    data['nivel'] = this.nivel;
    data['ponto'] = this.ponto;
    data['dataHora'] = this.dataHora;
    return data;
  }
}