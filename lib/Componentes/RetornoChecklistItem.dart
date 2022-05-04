// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Models/EscalaModel.dart';
import 'package:http/http.dart' as http;

class RetornaChecklistItem {
  static Future<List<EscalaModel>> getChecklist(double id) async {
    var prefs = await SharedPreferences.getInstance();
    String? enderecoApi = (prefs.getString("enderecoApi") ?? "");
    var url = Uri.https('${enderecoApi}', '/api/Jornadas/v1/$id', {'q': '{http}'});
    String accessToken = (prefs.getString("accessToken") ?? "");
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new EscalaModel.fromJson(job)).toList();
    } else {
      throw Exception('Erro, contact o administrador do APP');
    }
  }
}
