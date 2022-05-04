
// ignore_for_file: file_names

class UsuarioApi {
  bool? authenticated;
  String? expiration;
  String? created;
  String? accessToken;
  String? message;

  UsuarioApi({this.authenticated, this.expiration, this.accessToken, this.message});

  UsuarioApi.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    created = json['created'];
    expiration = json['expiration'];
    accessToken = json['accessToken'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticated'] = this.authenticated;
    data['created'] = this.created;
    data['expiration'] = this.expiration;
    data['accessToken'] = this.accessToken;
    data['message'] = this.message;
    return data;
  }
}