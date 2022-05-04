// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Models/ContatoCcoModel.dart';
import 'package:sigla_mobile/Models/ResultadoSimulador.dart';

class Resultado{

  static Future<ResultadoSimulador?> gravaResposta(int idNivel, double seqtripulante, int idpergunta, double ponto, String now) async {

    try{
      var prefs = await SharedPreferences.getInstance();
      String? accessToken = (prefs.getString("accessToken") ?? "");
      //double? idTripulante = (prefs.getDouble("idTripulante") ?? "");
      String? enderecoApi = (prefs.getString("enderecoApi") ?? "");

      var url = Uri.https('${enderecoApi}', '/api/SimuladorResultados/v1', {'q': '{http}'});

      var header = {
        "Content-Type" : "application/json",
        "Authorization" : "Bearer $accessToken"
      };

      Map params = {
        'idPergunta' : idpergunta,
        //'seqTripulante' : idTripulante,
        'nivel' : idNivel,
        'resposta' : 1,
        'ponto' : ponto,
        'dataHora' : now
      };
      //print(json.encode(params));
      var body = json.encode(params);

      var response = await http.post(
          url,
          headers: header,
          body: body
      );
      if(response.statusCode == 200){
        return ResultadoSimulador();
      }
    }catch(error, exception){
      print("Erro : $error > $exception ");
    }
  }
}