// // ignore_for_file: file_names
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
// class ContraCheque extends StatefulWidget {
//   @override
//   _ContraChequeState createState() => _ContraChequeState();
// }
//
// class _ContraChequeState extends State<ContraCheque> {
//   final Set<JavascriptChannel> jsChannels = {
//     JavascriptChannel(
//         name: 'Print',
//         onMessageReceived: (JavascriptMessage message) {
//           print(message.message);
//         }),
//   };
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//         appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.green, //change your color here
//           ),
//           title: const Text("Contra-cheque",
//             style: TextStyle(
//               color: Color(0xFF008e33),
//             ),),
//           centerTitle: true,
//           backgroundColor: Colors.black,
//           elevation: 0,
//         ),
//         body: Builder(builder: (BuildContext context) {
//           return SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: WebviewScaffold(
//               url: 'http://portalrm.guanabaraholding.com.br/Corpore.Net/Login.aspx?autoload=false',
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
