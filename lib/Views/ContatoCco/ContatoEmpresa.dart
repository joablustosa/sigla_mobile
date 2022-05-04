// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sigla_mobile/Models/ContatoEmpresaModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoEmpresa extends StatefulWidget {
  @override
  _ContatoEmpresaState createState() => _ContatoEmpresaState();
}

class _ContatoEmpresaState extends State<ContatoEmpresa> {
  Future<void>? _launched;

  Future<List<ContatoEmpresaModel>> getContato() async {
    var prefs = await SharedPreferences.getInstance();
    String accessToken = (prefs.getString("accessToken") ?? "");
    String enderecoApi = (prefs.getString("enderecoApi") ?? "");

    var url = Uri.http('${enderecoApi}', '/api/ContatoEmpresas/v1/', {'q': '{http}'});

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${accessToken}"
    };
    var response = await http.get(url, headers: header);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => ContatoEmpresaModel.fromJson(job)).toList();
    } else {
      return sairDoApp();
    }
  }

  sairDoApp() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('idTripulante');
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _makePhoneCall(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Não encontramos o numero $url';
      }
    }
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.green, //change your color here
          ),
          title: const Text("Contatos",
            style: TextStyle(
              color: Color(0xFF008e33),
            ),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder<List<ContatoEmpresaModel>>(
          future: getContato(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ContatoEmpresaModel>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return
                      ListTile(
                        tileColor: Colors.white,
                        onTap: (){
                          _launched = _makePhoneCall("tel://0" + snapshot.data![index].numeroContato!);
                        },
                        title: Text(snapshot.data![index].contatoSetor!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                        subtitle: Text(snapshot.data![index].responsavel! + " das " + snapshot.data![index].funcionamento!,
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                        trailing: GestureDetector(
                          child: const Icon(Icons.phone_callback, color: Colors.black,),
                        ),
                      );
                  });
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
