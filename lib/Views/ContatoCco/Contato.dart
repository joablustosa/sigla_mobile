// ignore: import_of_legacy_library_into_null_safe
// ignore_for_file: file_names

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigla_mobile/Componentes/AlertLogin.dart';
import 'package:sigla_mobile/Componentes/DiarioBordo.dart';
import 'package:sigla_mobile/Models/Tripulante.dart';

class Contato extends StatefulWidget {
  Tripulante tripulante;
  Contato(this.tripulante);
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  TextEditingController? _controllerTitulo = TextEditingController();
  TextEditingController? _controllerObservacao = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DiarioBordo? contatoCco;

  _onClickEnvie(BuildContext context) async {
    bool formOk = _formKey.currentState!.validate();
    if(!formOk){
      return;
    }
    final titulo = _controllerTitulo!.text;
    final mensagem = _controllerObservacao!.text;
    final seqtripulante = widget.tripulante.id;
    var now = DateTimeFormat.format(DateTime.now(), format: 'Y-m-d H:i:s');

    var contatoCco = await DiarioBordo.gravaContatoCco(titulo, mensagem, seqtripulante!, now);

    if(contatoCco != null){
      Navigator.pushReplacementNamed(context, "/inicio", arguments: widget.tripulante);
    }else{
      AlertLogin(context, "Erro no envio, verifique o texto novamente!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.green, //change your color here
          ),
          title: const Text("Diário de bordo",
            style: TextStyle(
              color: Color(0xFF008e33),
            ),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.network(
                          "https://cdn-icons-png.flaticon.com/512/1584/1584939.png",
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _controllerTitulo,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                              hintText: "Titulo da ocorrencia",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4)
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _controllerObservacao,
                          maxLines: 5,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                              hintText: "Detalhes da mensagem...",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                              )
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                color: Color(0xFF008e33),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Text(
                                  "Enviar mensagem",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  ),
                                ),
                                padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                onPressed: (){
                                  _onClickEnvie(context);
                                  //Navigator.pushReplacementNamed(context, "/inicio");
                                },
                              ),
                            )
                        ),
                      ],
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}