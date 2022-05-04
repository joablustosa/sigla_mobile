// ignore_for_file: file_names
// // ignore_for_file: file_names
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sigla_mobile/Models/NivelSimulador.dart';
// import 'package:http/http.dart' as http;
// import 'package:sigla_mobile/Models/Tripulante.dart';
//
// class SimuladorDePlacas extends StatefulWidget {
//   Tripulante tripulante;
//   SimuladorDePlacas(this.tripulante);
//   @override
//   _SimuladorDePlacasState createState() => _SimuladorDePlacasState();
// }
//
// class _SimuladorDePlacasState extends State<SimuladorDePlacas> {
//   String? urlIconeCategoria;
//
//   Future<List<NivelSimulador>> _getNivel() async {
//     var prefs = await SharedPreferences.getInstance();
//     String accessToken = (prefs.getString("accessToken") ?? "");
//     String enderecoApi = (prefs.getString("enderecoApi") ?? "");
//     var url ='${enderecoApi}/api/Simuladores/v1';
//
//     List<NivelSimulador> niveis;
//     var header = {
//       "Content-Type" : "application/json",
//       "Authorization" : "Bearer $accessToken"
//     };
//     var response = await http.get(url, headers: header);
//
//     if(response.statusCode == 200) {
//       List listaResponse = jsonDecode(response.body);
//       niveis = <NivelSimulador>[];
//
//       for (Map<String, dynamic>? map in listaResponse) {
//         NivelSimulador n = NivelSimulador.fromJson(map!);
//         niveis.add(n);
//       }
//
//     }else{
//       throw Exception();
//     }
//     return niveis;
//   }
//
//   _selecionaIcone(String tipo){
//     if(tipo == "Rh"){
//       urlIconeCategoria = "assets/icones/rh.png";
//     }else if(tipo == "Operação"){
//       urlIconeCategoria = "assets/icones/operacao.png";
//     }else if(tipo == "Manutenção"){
//       urlIconeCategoria = "assets/icones/manutencao.png";
//     }else if(tipo == "Legislação"){
//       urlIconeCategoria = "assets/icones/legislacao.png";
//     }else if(tipo == "Placas"){
//       urlIconeCategoria = "assets/icones/placas.png";
//     }else if(tipo == "Institucional"){
//       urlIconeCategoria = "assets/icones/empresa.png";
//     }else{
//
//     }
//     return urlIconeCategoria;
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getNivel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.green, //change your color here
//         ),
//         title: const Text(
//           "Selecione o nível",
//           style: TextStyle(
//             color: Color(0xFF008e33),
//           ),
//         ),
//         elevation: 0.0,
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height/1,
//         child: FutureBuilder(
//           future: _getNivel(),
//           builder: (context, snapshot){
//             if(snapshot.hasData){
//               return GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index){
//                   return GestureDetector(
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             height: 140,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(_selecionaIcone(snapshot.data[index].tipo))
//                                 )
//                             ),
//                           ),
//                           Text(snapshot.data[index].tipo,
//                             style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     onTap: (){
//                       Navigator.pushNamed(context, "/simuladorPerguntas", arguments: snapshot.data[index].id);
//                     },
//                   );
//                 },
//               );
//             }else if(snapshot.hasData == false){
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: const [
//                   Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 ],
//               );
//             }
//             return Container();
//           },
//         ),
//       )
//     );
//   }
// }
