// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Models/MensagemTripulante.dart';
import 'dart:async';

// ignore: must_be_immutable
class MensagensImportantes extends StatefulWidget {
  double id;
  MensagensImportantes(this.id);

  @override
  _MensagensImportantesState createState() => _MensagensImportantesState();
}

class _MensagensImportantesState extends State<MensagensImportantes> {

      Future<List<MensagemTripulante>> _getMensagem(double id) async {
      var prefs = await SharedPreferences.getInstance();
      String accessToken = (prefs.getString("accessToken") ?? "");
      String enderecoApi = (prefs.getString("enderecoApi") ?? "");

      var url = Uri.http('${enderecoApi}', '/api/Mensagens/v1/$id', {'q': '{http}'});
      List<MensagemTripulante> mensagens;

      var header = {
        "Content-Type" : "application/json",
        "Authorization" : "Bearer $accessToken"
      };
      var response = await http.get(url, headers: header);
      if(response.statusCode == 200) {
        List listaResponse = jsonDecode(response.body);
        mensagens = <MensagemTripulante>[];

        for (Map<String, dynamic> map in listaResponse) {
          MensagemTripulante m = MensagemTripulante.fromJson(map);
          mensagens.add(m);
        }
      }else{
        throw Exception();
      }
      return mensagens;
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.green, //change your color here
        ),
        title: const Text("Suas Mensagens",
          style: TextStyle(
            color: Color(0xFF008e33),
          ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox(
        height: 800,
        child: FutureBuilder(
          future: _getMensagem(widget.id),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                      padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Text(snapshot.data[index].titulo + "...",
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: Text(snapshot.data[index].mensagem + "...",
                                style: const TextStyle(
                                    fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white
                        ),
                      ),
                      onTap: (){
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
                                      child: Text(snapshot.data[index].titulo,
                                        style: const TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green
                                    ),
                                  ),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.3,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(snapshot.data[index].mensagem),
                                  ),
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
                                          "Fechar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18
                                          ),
                                        ),
                                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    )
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              );
            }else if(snapshot.hasData == false){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      )
    );
  }
}
