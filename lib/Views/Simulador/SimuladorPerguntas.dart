// ignore_for_file: file_names
// import 'dart:convert';
// import 'package:date_time_format/date_time_format.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:quiz_view/quiz_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sigla_mobile/Componentes/AlertLogin.dart';
// import 'package:sigla_mobile/Componentes/RespostaSimulador.dart';
// import 'package:sigla_mobile/Models/ItemSimulador.dart';
// import 'package:http/http.dart' as http;
//
// class SimuladorPerguntas extends StatefulWidget {
//   int idSimulador;
//   SimuladorPerguntas(this.idSimulador);
//   @override
//   _SimuladorPerguntasState createState() => _SimuladorPerguntasState();
// }
//
// class _SimuladorPerguntasState extends State<SimuladorPerguntas> {
//   final _formKey = GlobalKey<FormState>();
//   String dropdownValue = 'Selecione a resposta';
//   Future<List<ItemSimulador>> _getPergunta(idNivel) async {
//     var url ='http://sigla-api.guanabaraholding.com.br:8092/api/Perguntas/v1/Nivel/${idNivel}';
//     List<ItemSimulador> Perguntas;
//     var prefs = await SharedPreferences.getInstance();
//     String accessToken = (prefs.getString("accessToken") ?? "");
//     var header = {
//       "Content-Type" : "application/json",
//       "Authorization" : "Bearer $accessToken"
//     };
//     var response = await http.get(url, headers: header);
//
//     if(response.statusCode == 200) {
//       List listaResponse = jsonDecode(response.body);
//       Perguntas = List<ItemSimulador>();
//
//       for (Map map in listaResponse) {
//         ItemSimulador n = ItemSimulador.fromJson(map);
//         Perguntas.add(n);
//       }
//
//     }else{
//       throw Exception();
//     }
//     return Perguntas;
//   }
//
//   _gravaResposta(int id, int idSimulador, double ponto, DateTime data) async {
//     var prefs = await SharedPreferences.getInstance();
//     double seqtripulante = (prefs.getDouble("idTripulante"));
//
//     bool formOk = _formKey.currentState.validate();
//     if(!formOk){
//       return;
//     }
//     final idPergunta = id;
//     final idNivel = idSimulador;
//     final pontoPergunta = ponto;
//     final dataAtual = DateTimeFormat.format(data, format: 'Y-m-d H:i:s');
//     final idtripulante = seqtripulante;
//
//     var resultado = await Resultado.gravaResposta(idNivel, idtripulante, idPergunta, pontoPergunta, dataAtual);
//
//     if(resultado != null){
//
//     }else{
//       AlertLogin(context, "Não conseguimos gravar, talvez mais tarde!");
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//         appBar: AppBar(
//           iconTheme: IconThemeData(
//             color: Colors.green, //change your color here
//           ),
//           title: Text(
//             "Pergunta",
//             style: TextStyle(
//               color: Color(0xFF008e33),
//             ),
//           ),
//           elevation: 0.0,
//           centerTitle: true,
//           backgroundColor: Colors.white,
//         ),
//         body: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height/1.13,
//                   child: FutureBuilder(
//                     future: _getPergunta(widget.idSimulador),
//                     builder: (context, snapshot){
//                       List<ItemSimulador> data = snapshot.data;
//                       if(snapshot.hasData){
//                         return ListView.builder(
//                           itemCount: snapshot.data.length,
//                           itemBuilder: (BuildContext context, int index){
//                             return Container(
//                               width: MediaQuery.of(context).size.width/1.3,
//                               height: MediaQuery.of(context).size.height/1,
//                               child: QuizView(
//                                 image: Container(
//                                   width: 110,
//                                   height: 110,
//                                   child: Image.network(snapshot.data[index].imagem),
//                                 ),
//                                 showCorrect: true,
//                                 tagBackgroundColor: Colors.white,
//                                 tagColor: Colors.green,
//                                 questionTag: snapshot.data[index].categoria,
//                                 answerColor: Colors.white,
//                                 answerBackgroundColor: Colors.blue,
//                                 questionColor: Colors.black,
//                                 backgroundColor: Colors.white,
//                                 width: 300,
//                                 height: 500,
//                                 question: snapshot.data[index].descricao,
//                                 rightAnswer: snapshot.data[index].resposta,
//                                 wrongAnswers: [
//                                   snapshot.data[index].opcao1,
//                                   snapshot.data[index].opcao2,
//                                   snapshot.data[index].opcao3,
//                                 ],
//                                 onRightAnswer: () {
//                                   showDialog(
//                                       context: context,
//                                       barrierDismissible : false,
//                                       builder: (context) {
//                                         return WillPopScope(
//                                             onWillPop: () async => false,
//                                             child: AlertDialog(
//                                               title:Text("Acertou", style: TextStyle(color: Colors.white),),
//                                               backgroundColor: Colors.green,
//                                               content: Text("Boa, arrasta e continue jogando!", style: TextStyle(color: Colors.white),),
//                                               actions: <Widget>[
//                                                 FlatButton(
//                                                     child: Text("Ok", style: TextStyle(color: Colors.white),),
//                                                     onPressed: () {
//                                                       Navigator.pop(context);
//                                                     }
//                                                 )
//                                               ],
//                                             )
//                                         );
//                                       }
//                                   );
//                                   _gravaResposta(
//                                       snapshot.data[index].id,
//                                       widget.idSimulador,
//                                       snapshot.data[index].ponto,
//                                       new DateTime.now()
//                                   );
//                                 },
//                                 onWrongAnswer: () {
//                                   showDialog(
//                                       context: context,
//                                       barrierDismissible : false,
//                                       builder: (context) {
//                                         return WillPopScope(
//                                             onWillPop: () async => false,
//                                             child: AlertDialog(
//                                               title:Text("Errou", style: TextStyle(color: Colors.white),),
//                                               backgroundColor: Colors.red,
//                                               content: Text("Não foi dessa vez, arrasta e continue!", style: TextStyle(color: Colors.white),),
//                                               actions: <Widget>[
//                                                 FlatButton(
//                                                     child: Text("Ok", style: TextStyle(color: Colors.white),),
//                                                     onPressed: () {
//                                                       Navigator.pop(context);
//                                                     }
//                                                 )
//                                               ],
//                                             )
//                                         );
//                                       }
//                                   );
//                                     _gravaResposta(
//                                         snapshot.data[index].id,
//                                         widget.idSimulador,
//                                         0,
//                                         new DateTime.now()
//                                     );
//                                 }
//                               ),
//                             );
//                           },
//                         );
//                       }else if(snapshot.hasData == false){
//                         return new Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: CircularProgressIndicator(),
//                             )
//                           ],
//                         );
//                       }
//                       return new Container();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }
