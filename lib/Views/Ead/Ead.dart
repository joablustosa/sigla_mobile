// // ignore_for_file: file_names, avoid_print
//
// import 'dart:async';
// import 'dart:ffi';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:sigla_mobile/Models/Tripulante.dart';
//
// class Ead extends StatefulWidget {
//   Tripulante tripulante;
//   Ead(this.tripulante);
//   @override
//   _EadState createState() => _EadState();
// }
//
// class _EadState extends State<Ead> {
//   String? cpfConvertido;
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   _retornaCpf(double cpf){
//     cpfConvertido = cpf.toString();
//     print(cpfConvertido!.substring(0,11));
//     return cpfConvertido!.substring(0,11);
//   }
//   final Set<JavascriptChannel> jsChannels = {
//     JavascriptChannel(
//         name: 'Print',
//         onMessageReceived: (JavascriptMessage message) {
//           print(message.message);
//         }),
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.green, //change your color here
//           ),
//           title: const Text("E.A.D",
//             style: TextStyle(
//               color: Color(0xFF008e33),
//             ),),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//         body: Builder(builder: (BuildContext context) {
//           return SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: WebviewScaffold(
//               url: 'https://utilreal.sejaknowhow.com.br/users/login',
//               javascriptChannels: jsChannels,
//               mediaPlaybackRequiresUserGesture: false,
//               withZoom: true,
//               withLocalStorage: true,
//               hidden: true,
//               initialChild: Container(
//                 color: Colors.white,
//                 child: const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             ),
//           );
//         }),
//     );
//   }
// }
