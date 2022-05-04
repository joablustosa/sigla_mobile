// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Models/ContatoCcoModel.dart';

class DiarioBordo{

  static Future<ContatoCcoModel?> gravaContatoCco(String titulo, String mensagem, double seqtripulante, String now) async {

    try{
      var prefs = await SharedPreferences.getInstance();
      String accessToken = (prefs.getString("accessToken") ?? "");
      String enderecoApi = (prefs.getString("enderecoApi") ?? "");

      var url = Uri.https('${enderecoApi}', '/api/DiarioBordos/v1', {'q': '{http}'});

      var header = {
        "Content-Type" : "application/json",
        "Authorization" : "Bearer $accessToken"
      };

      Map params = {
        'titulo': titulo,
        'mensagem' : mensagem,
        'seqTripulante' : seqtripulante,
        'dataCriacao' : now
      };

      var body = json.encode(params);

      var response = await http.post(
          url,
          headers: header,
          body: body
      );
      if(response.statusCode == 200){
        return ContatoCcoModel();
      }
    }catch(error, exception){
      print("Erro : $error > $exception ");
    }
  }
}