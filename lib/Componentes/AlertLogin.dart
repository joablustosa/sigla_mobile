// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names
AlertLogin(BuildContext context, String msg){
  showDialog(
      context: context,
      barrierDismissible : false,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title:const Text("Simulador"),
              content: Text(msg),
              actions: <Widget>[
                MaterialButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                )
              ],
            )
        );
      }
  );
}