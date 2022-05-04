// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Models/UsuarioApi.dart';

class LoginApi{
  static Future<UsuarioApi?> login(String enderecoApi, String userApi, String senhaApi) async {
    try{
      var prefs = await SharedPreferences.getInstance();
      String? accessToken = (prefs.getString("accessToken") ?? "");

      var url = Uri.http('${enderecoApi}', '/api/Login/v1', {'q': '{http}'});
      var header = {"Content-Type" : "application/json"};

      Map? params = {
        'usuarioLogin': userApi,
        'chaveDeAcesso' : senhaApi,
      };

      var body = json.encode(params);

      var response = await http.post(
          url,
          headers: header,
          body: body
      );

      Map<String, dynamic>? mapResponse = json.decode(response.body);
      if(response.statusCode == 200){
        final usuarioApi = UsuarioApi.fromJson(mapResponse!);
        prefs.setString("accessToken", mapResponse["accessToken"]);
        //print(mapResponse["accessToken"]);
        return usuarioApi;
      }
    }catch(error, exception){
      print("Erro : $error > $exception ");
    }
  }
}