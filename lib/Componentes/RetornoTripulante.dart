// ignore: import_of_legacy_library_into_null_safe
// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Models/Tripulante.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RetornoTripulante{

  static Future<Tripulante?> loginTripulante(String enderecoApi, String usuario, String senha, String dominio) async {
    //print(enderecoApi);

    try{
      var prefs = await SharedPreferences.getInstance();
      String accessToken = (prefs.getString("accessToken") ?? "");
      var url = Uri.http('${enderecoApi}', '/api/Tripulantes/v1', {'q': '{http}'});

      var header = {
        "Content-Type" : "application/json",
        "Authorization" : "Bearer ${accessToken}"
      };

      Map params = {
        'cpf': usuario,
        'senha' : senha,
        'dominio' : dominio
      };

      var body = json.encode(params);

      var response = await http.post(
          url,
          headers: header,
          body: body
      );

      Map<String, dynamic>? mapResponse = json.decode(response.body);

      if(response.statusCode == 200){
        final tripulante = Tripulante.fromJson(mapResponse!);
        var prefs = await SharedPreferences.getInstance();
        prefs.setDouble("idTripulante", mapResponse["id"]);

        return tripulante;
      }
    }catch(error, exception){
      print("Erro : $error > $exception ");
    }
  }
}