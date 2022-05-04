// ignore: file_names
// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Componentes/RetornoJornada.dart';
import 'package:sigla_mobile/Models/EscalaModel.dart';
import 'package:http/http.dart' as http;
import 'package:sigla_mobile/Models/Tripulante.dart';

// ignore: must_be_immutable
class Escala extends StatefulWidget {
  Tripulante tripulante;
  Escala(this.tripulante);
  @override
  _EscalaState createState() => _EscalaState();
}

class _EscalaState extends State<Escala> {
  Text? _titulo;
  Text? _trecho;

  Widget? _tituloEscolhido(flgestado, flgtipo, codlinha, codatividade){
    if(flgestado == "P" || flgestado == "A"){
      _titulo = const Text(
          "Clique aqui e visualise sua escala",
          style: TextStyle(
          color: Colors.black,
          fontSize: 14
        )
      );
    }else{
      if(flgtipo == "A"){
        _titulo = Text(
            codatividade,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14
            )
        );
      }else{
        _titulo = Text(
            codlinha,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14
            )
        );
      }
    }
    return _titulo;
  }

  Widget? _childExpansion(flgestado, flgtipo, codlinha, codatividade, dtjornada, servico, codiataorig, codiatadest, partidaprev, chegadaprev, dthrinicio, dthrfim, c_apresentacao){
    if(flgestado == "P" || flgestado == "A"){
      _titulo = const Text(
          "Clique aqui e visualise sua escala",
          style: TextStyle(
              color: Colors.black,
              fontSize: 14
          )
      );
    }else{
      if(flgtipo == "A"){
        _trecho = const Text(
            "Nenhum trecho",
            style: TextStyle(
                color: Colors.black,
                fontSize: 10
            )
        );
      }else{
        _trecho = Text(
            "Trecho: " + codiataorig + " X " + codiatadest,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14
            )
        );
      }
    }
    return _trecho;
  }

  Future<List<EscalaModel>?>? alteraEstado(double? id) async {
    var prefs = await SharedPreferences.getInstance();
    String accessToken = (prefs.getString("accessToken") ?? "");
    String enderecoApi = (prefs.getString("enderecoApi") ?? "");
    //print('${enderecoApi}' + '/api/VisualizaJornadas/v1/$id');
    var url = Uri.http('${enderecoApi}', '/api/VisualizaJornadas/v1/$id', {'q': '{http}'});
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {

    } else {
      throw Exception('Erro, contact o administrador do APP');
    }
  }

  _formataDataHora(data){
    var t = DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(data));
    return t.toString();
  }

  _formataData(data){
    var t = DateFormat("dd/MM/yyyy").format(DateTime.parse(data));
    return t.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.green, //change your color here
          ),
          title: const Text("Escala",
            style: TextStyle(
              color: Color(0xFF008e33),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      body: FutureBuilder<List<EscalaModel>>(
        future: RetornaJornada.getJornada(widget.tripulante.id!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EscalaModel> data = snapshot.data ?? [];
            return GroupedListView<EscalaModel, String>(
              elements: data,
              groupBy: (EscalaModel e) => _formataData(e.dtjornada),
              groupSeparatorBuilder: (String groupByValue) => Center(
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    const Icon(Icons.calculate_outlined, color: Colors.green,),
                                                                    Text(
                                                                      groupByValue,
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight.bold,
                                                                            color: Colors.red,
                                                                            fontSize: 18
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                ),
              itemBuilder: (BuildContext context, EscalaModel e) =>
              e.flgestado == 'P' || e.flgestado == 'A' ?
              ListTile(
                title: const Text("Clique e veja sua escala",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: const Text("Seja Bem vindo",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onTap: (){
                  alteraEstado(e.secjornada!);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/1.3,
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: _tituloEscolhido(e.flgestado, e.flgtipo, e.codlinha, e.codatividade),
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            e.c_apresentacao != null ? Row(
                              children: [
                                const Icon(Icons.watch, color: Colors.purple, size: 16,),
                                const Text("Apresentação: ",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                                Text(_formataDataHora(e.c_apresentacao),
                                  style: const TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ],
                            ) : Container(),
                            e.c_apresentacao != null ? const SizedBox(
                              height: 15,
                            ) : Container(),
                            e.codiataorig != null ? Row(
                              children: [
                                Icon(e.codiataorig != null ? Icons.location_on : Icons.arrow_forward_ios_rounded),
                                Text(e.codiataorig ?? ""),
                                Text(e.codiataorig != null ? " - " : ""),
                                Text(e.codiatadest ?? ""),
                              ],
                            ) : Container(),
                            e.c_apresentacao != null ? const SizedBox(
                              height: 15,
                            ) : Container(),
                            e.partidaprev != null ? Row(
                              children: [
                                const Icon(Icons.watch_later),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(e.partidaprev != null ? _formataDataHora(e.partidaprev) : ""),
                              ],
                            ) : Container(),

                            const SizedBox(
                              width: 15,
                            ),
                            e.chegadaprev != null ? Row(
                              children: [
                                const Icon(Icons.history_outlined),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(e.chegadaprev != null ? _formataDataHora(e.chegadaprev) : ""),
                              ],
                            ) : Container(),
                            e.partidaprev != null ? const SizedBox(
                              height: 15,
                            ) : Container(),
                            e.observacao_jornada != null ? Row(
                              children: [
                                const Icon(Icons.warning),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(e.observacao_jornada ?? ""),
                              ],
                            ) : Container(),
                            e.observacao_jornada != null ? const SizedBox(
                              height: 15,
                            ) : Container(),
                            e.observacao_programacao != null ? Row(
                              children: [
                                const Icon(Icons.flag_outlined),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(e.observacao_programacao ?? ""),
                              ],
                            ) : Container(),
                            e.prefixo != null ? Row(
                              children: [
                                const Icon(Icons.directions_bus),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(e.prefixo ?? ""),
                              ],
                            ) : Container(),
                          ],
                        ),
                        actions: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: MaterialButton(
                                  color: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: const Text(
                                    "Confirmar visualização",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18
                                    ),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacementNamed(context, "/escala", arguments: widget.tripulante);
                                  },
                                ),
                              )
                          ),
                        ],
                      );
                    },
                  );
                },
              ) :
              ExpansionTile(
                title: _tituloEscolhido(e.flgestado, e.flgtipo, e.codlinha, e.codatividade)!,
                childrenPadding: const EdgeInsets.all(8),
                children: [
                  Column(
                    children: [
                      e.c_apresentacao != null ? Row(
                        children: [
                          const Icon(Icons.watch, color: Colors.purple, size: 28),
                          const Text("Apresentação: "),
                          Text(_formataDataHora(e.c_apresentacao)) ,
                        ],
                      ) : Container(),
                      e.c_apresentacao != null ? const SizedBox(
                        height: 15,
                      ) : Container(),
                      e.codiataorig != null ? Row(
                        children: [
                          Icon(e.codiataorig != null ? Icons.location_on : Icons.arrow_forward_ios_rounded, color: Colors.redAccent, size: 28),
                          Text(e.codiataorig ?? ""),
                          Text(e.codiataorig != null ? " - " : ""),
                          Text(e.codiatadest ?? ""),
                        ],
                      ) : Container(),
                      e.c_apresentacao != null ? const SizedBox(
                        height: 15,
                      ) : Container(),
                      e.partidaprev != null ? Row(
                        children: [
                          const Icon(Icons.watch_later, color: Colors.green, size: 28),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(e.partidaprev != null ? _formataDataHora(e.partidaprev) : ""),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Icons.history_outlined, color: Colors.orangeAccent, size: 28),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(e.chegadaprev != null ? _formataDataHora(e.chegadaprev) : ""),
                        ],
                      ) : Container(),
                      e.partidaprev != null ? const SizedBox(
                        height: 15,
                      ) : Container(),
                      e.observacao_jornada != null ? Row(
                        children: [
                          const Icon(Icons.warning, color: Colors.red, size: 28),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(e.observacao_jornada ?? ""),
                        ],
                      ) : Container(),
                      e.observacao_jornada != null ? const SizedBox(
                        height: 15,
                      ) : Container(),
                      e.observacao_programacao != null ? Row(
                        children: [
                          const Icon(Icons.flag_outlined, color: Colors.yellowAccent, size: 28),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(e.observacao_programacao ?? ""),
                        ],
                      ) : Container(),
                      e.prefixo != null ? Row(
                        children: [
                          const Icon(Icons.directions_bus, color: Colors.black87, size: 28),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(e.prefixo ?? "",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ) : Container(),
                    ],
                  )
                ],
              ),
              // groupBuilder: (BuildContext context, String dtjornada) =>
              //   Center(
              //     child: Container(
              //       child: Padding(
              //         padding: const EdgeInsets.all(6),
              //         child: Text(dtjornada, style: const TextStyle(color: Colors.white),),
              //       ),
              //       decoration: BoxDecoration(
              //         color: Colors.green,
              //         borderRadius: BorderRadius.circular(8)
              //       ),
              //     ),
              //   ),
            );
          } else if (snapshot.hasError) {
            return Text(
              "${snapshot.error}",
              style: const TextStyle(fontSize: 16),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator()
            ],
          );
        },
      )
    );
  }
}