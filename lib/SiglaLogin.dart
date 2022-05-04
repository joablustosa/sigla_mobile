// ignore: file_names
// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Componentes/RetornoTripulante.dart';
import 'Componentes/AlertLogin.dart';
import 'Componentes/LoginApi.dart';
import 'dart:async';
import 'dart:convert';

Color corPadrao = Colors.white;
Color corPadraoLight = const Color(0xFF1B5E20);


class SiglaLogin extends StatefulWidget {
  @override
  _SiglaLoginState createState() => _SiglaLoginState();
}

class _SiglaLoginState extends State<SiglaLogin> {
  FocusNode myFocusNode = FocusNode();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _listaConfiguracao = [];

  String? _validateLogin(String? text){
    if(text!.isEmpty){
      return "Informe o seu CPF";
    }
    return "";
  }
  String? _validateSenha(String? text){
    if(text!.isEmpty){
      return "Informe a senha";
    }
    return null;
  }
  _loginApi() async {
    //print(_listaConfiguracao[0]["endereco"]);
    const userApi = "admin";
    const senhaApi = "sigl@2018";
    return await LoginApi.login(
        _listaConfiguracao.isNotEmpty ? _listaConfiguracao[0]["endereco"] : "sigla-api.guanabaraholding.com.br:8092",
        userApi,
        senhaApi
    );
  }
  _onClickLogin(BuildContext context) async {
    //print(_listaConfiguracao[0]["endereco"]);
  _loginApi();
  // bool? formOk = _formKey.currentState!.validate();
  //   if(!formOk){
  //     return;
  //   }
    //print(formOk);
    final usuario = _tLogin.text;
    final senha = _tSenha.text;
    final dominio = "2";

    var tripulante = await RetornoTripulante.loginTripulante(
        _listaConfiguracao.isNotEmpty ? _listaConfiguracao[0]["endereco"] : "sigla-api.guanabaraholding.com.br:8092",
        usuario,
        senha,
        dominio
    );

    if(tripulante != null){
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("enderecoApi", _listaConfiguracao.isNotEmpty ? _listaConfiguracao[0]["endereco"] : "sigla-api.guanabaraholding.com.br:8092");
      Navigator.pushReplacementNamed(context, "/inicio", arguments: tripulante);
      //print(prefs.get("enderecoApi"));
    }else{
      AlertLogin(context, "Erro no Login, verifique seu usuário e senha!");
    }
  }
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // String _message = '';
  //
  // _registerOnFirebase() {
  //   _firebaseMessaging.subscribeToTopic('all');
  //   _firebaseMessaging.getToken().then((token) => print(token));
  // }
  //
  // void getMessage() {
  //   _firebaseMessaging.configure(
  //       onMessage: (Map<String, dynamic> message) async {
  //         print('received message');
  //         setState(() => _message = message["notification"]["body"]);
  //       }, onResume: (Map<String, dynamic> message) async {
  //     print('on resume $message');
  //     setState(() => _message = message["notification"]["body"]);
  //   }, onLaunch: (Map<String, dynamic> message) async {
  //     print('on launch $message');
  //     setState(() => _message = message["notification"]["body"]);
  //   });
  // }

  Future<File> _getFile() async{
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dadosApi.json");
  }

  _lerArquivo() async{
    try{
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }
  }

@override
  void initState() {
    _lerArquivo().then((dados){
      setState(() {
        _listaConfiguracao = json.decode(dados);
      });
    });
    //getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_listaConfiguracao.isEmpty ? null : print(_listaConfiguracao[0]["endereco"]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC5E1A5),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/loginEmpresa");
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.settings, color: Colors.green,),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                    color: Color(0xFFC5E1A5),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text(
                          "SIGLA MOBILE",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                    Center(
                      child: Image.asset("assets/img/LogoSigla.png", width: 100, height: 100,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 32, right: 32, bottom: 4),
                child: _textInputEmail(hint: "Digite seu CPF", icon: Icons.person_outline_rounded),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 32, right: 32, bottom: 8),
                child: _textInputSenha(hint: "Senha", icon: Icons.vpn_key),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    color: const Color(0xFF008e33),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: const Text(
                      "Acessar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    onPressed: (){
                      //_loginApi();
                      _onClickLogin(context);
                    },
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }
  Widget _textInputEmail({controller, hint, icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        style: const TextStyle(color: Colors.black, fontSize: 20),
        cursorColor: Colors.green,
        controller: _tLogin,
        validator: _validateLogin,
        keyboardType: TextInputType.number,
        onChanged: (value){

        },
        autofocus: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
  Widget _textInputSenha({controller, hint, icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        style: const TextStyle(color: Colors.black, fontSize: 20),
        cursorColor: Colors.green,
        controller: _tSenha,
        validator: _validateSenha,
        obscureText: true,
        keyboardType: TextInputType.text,
        onChanged: (value){

        },
        autofocus: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}