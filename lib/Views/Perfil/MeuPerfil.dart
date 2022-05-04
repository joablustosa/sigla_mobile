// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigla_mobile/Models/Tripulante.dart';

class MeuPerfil extends StatefulWidget {
  Tripulante tripulante;
  MeuPerfil(this.tripulante);
  @override
  _MeuPerfilState createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  FocusNode myFocusNode = FocusNode();
  final _tTelefone1 = TextEditingController();
  final _tTelefone2 = TextEditingController();
  final _tTelefone3 = TextEditingController();
  final _tTelefone4 = TextEditingController();
  final _tTelefone5 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateTelefone(String? text){
    if(text!.isEmpty){
      return "Informe o seu telefone";
    }
    return null;
  }
  String? _validateTelefone1(String? text){
    if(text!.isEmpty){
      return "Informe o seu telefone";
    }
    return null;
  }
  String? _validateTelefone2(String? text){
    if(text!.isEmpty){
      return "Informe o seu telefone";
    }
    return null;
  }
  String? _validateTelefone3(String? text){
    if(text!.isEmpty){
      return "Informe o seu telefone";
    }
    return null;
  }
  String? _validateTelefone4(String? text){
    if(text!.isEmpty){
      return "Informe o seu telefone";
    }
    return null;
  }
  String? _validateTelefone5(String? text){
    if(text!.isEmpty){
      return "Informe o seu telefone";
    }
    return null;
  }
  _onClickAtualize(BuildContext context) async {
    bool formOk = _formKey.currentState!.validate();
    if(!formOk){
      return;
    }
    // final usuario = _tLogin.text;
    // final senha = _tSenha.text;
    // final dominio = "2";
    //
    // var tripulante = await RetornoTripulante.loginTripulante(usuario, senha, dominio);
    //
    // if(tripulante != null){
    //   Navigator.pushReplacementNamed(context, "/inicio", arguments: tripulante);
    // }else{
    //   AlertLogin(context, "Erro no Login, verifique seu usuário e senha!");
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil",
          style: TextStyle(
            color: Colors.white,
          ),),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
                child: Text("Cadastre seus contatos", style: GoogleFonts.lato(color: Colors.green, fontSize: 22)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _tTelefone1,
                  validator: _validateTelefone1,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF008e33),
                        )
                    ),
                    labelText: "Telefone 1",
                    labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.grey : const Color(0xFF008e33),
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onChanged: (value){

                  },
                  autofocus: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _tTelefone2,
                  validator: _validateTelefone2,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF008e33),
                        )
                    ),
                    labelText: "Telefone 2",
                    labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.grey : const Color(0xFF008e33),
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onChanged: (value){

                  },
                  autofocus: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                child: TextFormField(
                  controller: _tTelefone3,
                  validator: _validateTelefone3,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF008e33),
                        )
                    ),
                    labelText: "Telefone 3",
                    labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.grey : const Color(0xFF008e33),
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onChanged: (value){

                  },
                  autofocus: false,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      color: const Color(0xFF008e33),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: const Text(
                        "Atualizar Dados",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 16,16, 16),
                      onPressed: (){
                        //_registerOnFirebase();
                        _onClickAtualize(context);
                        //Navigator.pushReplacementNamed(context, "/inicio");
                      },
                    ),
                  )
              ),
              const Divider(),
              SizedBox(
                child: Text("Vencimento da habilitação", style: GoogleFonts.lato(color: Colors.green, fontSize: 22)),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        height: 120,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/icones/habilitacao.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: Center(
                          child: Text("13/03/1991", style: GoogleFonts.lato(color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
