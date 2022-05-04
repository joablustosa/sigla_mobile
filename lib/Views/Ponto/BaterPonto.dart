// // ignore_for_file: file_names
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:sigla_mobile/Componentes/Syncronizer.dart';
// import 'package:sigla_mobile/Componentes/contactinfomodel.dart';
// import 'package:sigla_mobile/Componentes/controller.dart';
//
// class BaterPonto extends StatefulWidget {
//   const BaterPonto({required Key key}) : super(key: key);
//
//   @override
//   _BaterPontoState createState() => _BaterPontoState();
// }
//
// class _BaterPontoState extends State<BaterPonto> {
//   Timer? _timer;
//   TextEditingController? name = TextEditingController();
//   TextEditingController? email = TextEditingController();
//   TextEditingController? gender = TextEditingController();
//
//   late List list;
//   bool loading = true;
//   Future userList()async{
//     list = await Controller().fetchData();
//     setState(() {loading=false;});
//     //print(list);
//   }
//
//   Future? syncToMysql()async{
//     await SyncronizationData().fetchAllInfo().then((userList)async{
//       EasyLoading.show(status: 'Dont close app. we are sync...');
//       await SyncronizationData().saveToMysqlWith(userList);
//       EasyLoading.showSuccess('Successfully save to mysql');
//     });
//   }
//
//   Future? isInteret()async{
//     await SyncronizationData.isInternet().then((connection){
//       if (connection) {
//
//         print("Internet connection abailale");
//       }else{
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Internet")));
//       }
//     });
//   }
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     userList();
//     isInteret();
//     EasyLoading.addStatusCallback((status) {
//       print('EasyLoading Status $status');
//       if (status == EasyLoadingStatus.dismiss) {
//         _timer?.cancel();
//       }
//     });
//
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sync Sqflite to Mysql"),
//         actions: [
//           IconButton(icon: const Icon(Icons.refresh_sharp), onPressed: ()async{
//             await SyncronizationData.isInternet().then((connection){
//               if (connection) {
//                 syncToMysql();
//                 print("Internet connection abailale");
//               }else{
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Internet")));
//               }
//             });
//           })
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: name,
//               decoration: const InputDecoration(hintText: 'Enter name'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: email,
//               decoration: const InputDecoration(hintText: 'Enter email'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: gender,
//               decoration: const InputDecoration(hintText: 'Enter gender'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: RaisedButton(
//               onPressed: () async{
//                 ContactinfoModel contactinfoModel = ContactinfoModel(id: 0,userId: 1,name: name!.text,email: email!.text,gender: gender!.text,createdAt: DateTime.now().toString());
//                 await Controller().addData(contactinfoModel).then((value){
//                   if (value! > 0) {
//                     print("Success");
//                     userList();
//                   }else{
//                     print("faild");
//                   }
//
//                 });
//               },
//               child: const Text("Save"),
//             ),
//           ),
//           loading ? const Center(child: CircularProgressIndicator()):Expanded(
//             child: ListView.builder(
//               itemCount: list.length ?? 0,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(list[index]['id'].toString()),
//                       const SizedBox( width: 5,),
//                       Text(list[index]['name']),
//                     ],),
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(list[index]['email']),
//                       Text(list[index]['gender']),
//                     ],),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
