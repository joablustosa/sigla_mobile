
// ignore_for_file: file_names

class MensagemTripulante {

  double? secmensagem;
  String? titulo;
  String? mensagem;

  MensagemTripulante(
    {this.secmensagem,
    this.titulo,
    this.mensagem
  });

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "secmensagem" : this.secmensagem,
      "titulo" : this.titulo,
      "mensagem" : this.mensagem
    };
    return map;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secmensagem'] = this.secmensagem;
    data['titulo'] = this.titulo;
    data['mensagem'] = this.mensagem;
    return data;
  }

  MensagemTripulante.fromJson(Map<String, dynamic> json) {
    secmensagem = json['secmensagem'];
    titulo = json['titulo'];
    mensagem = json['mensagem'];
  }
}