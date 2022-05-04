// ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sigla_mobile/Models/RankingTimeModel.dart';
//
// Widget ItemRanking(BuildContext context, RankingTimeModel perfil, index){
//  return
//    Stack(
//      alignment: Alignment.centerLeft,
//      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.all(4.0),
//          child: Container(
//            height: 70.0,
//            width: MediaQuery.of(context).size.width/1.05,
//            child: Padding(
//              padding: const EdgeInsets.only(left: 50.0),
//              child: ListTile(
//                onTap: (){
//                  // ignore: void_checks
//                  return showDialog(
//                      context: context,
//                      builder: (BuildContext context){
//                        return AlertDialog(
//                          title: Text("Média Geral", style: GoogleFonts.lato(color: Colors.black)),
//                          content: Column(
//                            mainAxisSize: MainAxisSize.min,
//                            children: [
//                              Padding(
//                                padding: EdgeInsets.all(8),
//                                child: Center(
//                                  child: Text("Para entrar na Premiação mensal, além de está entre os melhores do time, "
//                                      "O Competidor deverá está com a performance acima de 100%", style: GoogleFonts.lato(color: Colors.red)),
//                                ),
//
//                              ),
//                              Padding(
//                                  padding: const EdgeInsets.all(8),
//                                  child: Text(perfil.kml != null ?
//                                  perfil.kml.toStringAsPrecision(2) + " Km/L" :
//                                  "Sem kml",
//                                      style: GoogleFonts.lato(fontSize: 32, color: Colors.green))
//                              ),
//                            ],
//                          ),
//                          actions: <Widget>[
//                            new Padding(
//                                padding: const EdgeInsets.all(8),
//                                child: Container(
//                                  width: MediaQuery.of(context).size.width,
//                                  child: MaterialButton(
//                                    color: Colors.red,
//                                    shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(6)
//                                    ),
//                                    child: Text(
//                                      "Fechar",
//                                      style: TextStyle(
//                                          color: Colors.white,
//                                          fontSize: 18
//                                      ),
//                                    ),
//                                    onPressed: (){
//                                      Navigator.of(context).pop();
//                                    },
//                                  ),
//                                )
//                            ),
//                          ],
//                        );
//                      }
//                  );
//                },
//                //title: Text(perfil.nome_guerra !=  null ? perfil.nome_guerra : "Nome", style: GoogleFonts.lato(color: Colors.white, fontSize: 16)),
//                title: Text(perfil.nome_guerra, style: GoogleFonts.lato(color: Colors.white, fontSize: 16)),
//                subtitle: Text(
//                    perfil.resultadoTrecho != null ?
//                    (perfil.resultadoTrecho*100).toStringAsPrecision(4) + "%" :
//                    'Res',
//                     style: GoogleFonts.lato(
//                         color: perfil.resultadoTrecho < 1 ? Colors.red : Colors.green
//                     )
//                ),
//                leading: CircleAvatar(
//                  backgroundColor: Colors.transparent,
//                  child: Center(
//                    child: Text((index+1).toString() + "º", style: GoogleFonts.lato(color: Colors.lightGreenAccent, fontSize: 18)),
//                  ),
//                ),
//                trailing: Text(perfil.pontoTrecho != null ? (perfil.pontoTrecho).toString() : "0Pts", style: GoogleFonts.lato(color: Colors.lightGreenAccent, fontSize: 12)),
//              ),
//            ),
//            decoration: BoxDecoration(
//                color: Color(0xFF303030),
//                borderRadius: BorderRadius.only(
//                  bottomLeft: Radius.circular(100),
//                  topLeft: Radius.circular(100),
//                  bottomRight: Radius.circular(50),
//                  topRight: Radius.circular(50),
//                )
//            ),
//          ),
//        ),
//        Container(
//          height: 70.0,
//          width: 70.0,
//          decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.circular(100),
//              image: DecorationImage(
//                image: NetworkImage(perfil.imagemTime != null ? perfil.imagemTime : 'https://png.pngtree.com/png-vector/20190116/ourlarge/pngtree-vector-shield-icon-png-image_322145.jpg'),
//                fit: BoxFit.cover
//              )
//          ),
//        ),
//      ],
//    );
// }

// ListTile(
//   onTap: (){
//     return showDialog(
//         context: context,
//         builder: (BuildContext context){
//           return AlertDialog(
//             title: Text("Descrição Trecho"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Text("KM, LITROS, META")
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               new Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: MaterialButton(
//                       color: Colors.red,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6)
//                       ),
//                       child: Text(
//                         "Fechar",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18
//                         ),
//                       ),
//                       onPressed: (){
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   )
//               ),
//             ],
//           );
//         }
//     );
//   },
//   title: Text(
//       snapshot.data[index].sigla_origem != null ?
//       snapshot.data[index].sigla_origem + " X " + snapshot.data[index].sigla_destino :
//       "Sem trecho",
//       style: GoogleFonts.lato(fontSize: 14)),
//   subtitle: Text(snapshot.data[index].ResultadoTrecho.toString() != null ?
//   (snapshot.data[index].ResultadoTrecho*100).toStringAsPrecision(4)+"%" :
//   "Resultado"
//       , style: GoogleFonts.oswald(fontSize: 14, color: Colors.green)),
//   trailing: Container(
//     width: 100,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(snapshot.data[index].kml.toString() != null ?
//         snapshot.data[index].kml.toString() :
//         "Sem kml",
//             style: GoogleFonts.oswald(fontSize: 16, color: Colors.red)
//         ),
//         Icon(Icons.arrow_right)
//       ],
//     ),
//   ),
//   leading: Container(
//       width: 50,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(_formataData(snapshot.data[index].partida_realizada), style: GoogleFonts.oswald(fontSize: 16)),
//               Text(_formataHora(snapshot.data[index].partida_realizada), style: GoogleFonts.oswald(fontSize: 16))
//             ],
//           ),
//           SizedBox(
//             width: 2,
//             child: Container(
//               color: Colors.blue,
//             ),
//           )
//         ],
//       )
//   ),
// );