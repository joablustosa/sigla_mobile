// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Componentes/AlertLogin.dart';
import 'dart:async';
import 'dart:convert';

class EmpresaLogin extends StatefulWidget {
  @override
  _EmpresaLoginState createState() => _EmpresaLoginState();
}

class _EmpresaLoginState extends State<EmpresaLogin> {
  FocusNode myFocusNode = new FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _listaConfiguracao = [];
  TextEditingController _controllerEndereco = TextEditingController();

  String? _validateApi(String? text){
    if(text!.isEmpty){
      return "Informe sua empresa";
    }
    return null;
  }

  _salvarEndereco(BuildContext context) async {
    bool formOk = _formKey.currentState!.validate();
    if(!formOk){
      return;
    }
    final enderecoApi = _controllerEndereco.text;
    if(enderecoApi != null){

      Map<String, dynamic> configApi = Map();
      configApi["endereco"] = "${enderecoApi}";
      _listaConfiguracao.add(configApi);
      _salvarArquivo();
      Navigator.pushReplacementNamed(context, "/login");
    }else{
      AlertLogin(context, "Erro no Login, verifique seu usuário e senha!");
    }
  }

  _salvarArquivo() async{
    var arquivo =  await _getFile();
    String dados = json.encode(_listaConfiguracao);
    arquivo.writeAsString(dados);
  }

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
    if(_getFile() != null){
      _lerArquivo().then((dados){
        setState(() {
          _listaConfiguracao = json.decode(dados);
        });
      });
    }else{
      _salvarArquivo();
      _lerArquivo().then((dados){
        setState(() {
          _listaConfiguracao = json.decode(dados);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    //print(_listaConfiguracao.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Empresa"),
        centerTitle: true,
        backgroundColor: Color(0xFF33691E),
        elevation: 0,
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/login");
            },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Image.network("https://rockcontent.com/br/wp-content/uploads/sites/2/2020/04/rest-api-1.png",
              //     width: MediaQuery.of(context).size.width/1.1,
              //
              //   ),
              // ),
              _listaConfiguracao.isEmpty ? Container() : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_listaConfiguracao[0]["endereco"],
                  style: const TextStyle(
                    fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: _controllerEndereco,
                  validator: _validateApi,
                  keyboardType: TextInputType.text,
                  onChanged: (valorAlterado){
                    _listaConfiguracao[0]["endereco"] = valorAlterado;
                  },
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF008e33),
                        )
                    ),
                    labelText: "Endereço API",
                    labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.grey : const Color(0xFF008e33),
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  autofocus: false,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      color: const Color(0xFF008e33),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: const Text(
                        "Salvar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      onPressed: (){
                        _salvarEndereco(context);
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
}
