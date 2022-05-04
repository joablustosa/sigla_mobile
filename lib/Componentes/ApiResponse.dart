// ignore_for_file: file_names

class ApiResponse<T>{
  bool? ok;
  String? msg;
  T? result;
  ApiResponse.ok(this.result){
    ok = true;
  }
  ApiResponse.error(this.msg){
    ok = false;
  }
}