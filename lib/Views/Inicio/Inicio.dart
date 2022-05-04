
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigla_mobile/Models/Tripulante.dart';

// ignore: must_be_immutable
class Inicio extends StatefulWidget {
  Tripulante tripulante;
  Inicio(this.tripulante);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  sairDoApp() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('idTripulante');
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.green, //change your color here
        ),
        title: Text(
           "SIGLA " + widget.tripulante.nomeguerra!,
          style: const TextStyle(
            color: Color(0xFF008e33),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage('https://www.elsevier.com/__data/assets/image/0004/823261/information-system-supporting-science.jpg'),
                    fit: BoxFit.cover,
                  ),
                ), child: null,
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Sigla Motorista',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/inicio", arguments: widget.tripulante);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_box_outlined),
                title: const Text('Minha escala'),
                onTap: () {
                  Navigator.pushNamed(context, "/escala", arguments: widget.tripulante);
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book_rounded),
                title: const Text('Diário de bordo'),
                onTap: () {
                  Navigator.pushNamed(context, "/contato", arguments: widget.tripulante);
                },
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Mensagens'),
                onTap: () {
                  Navigator.pushNamed(context, "/mensagensImportantes", arguments: widget.tripulante.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Sair'),
                onTap: () {
                  sairDoApp();
                },
              ),
            ],
          ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/img/LogoSigla.png", width: 100, height: 100,),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.tripulante.nome!,
                        style: const TextStyle(
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.tripulante.matricula!,
                        style: const TextStyle(color: Colors.green, fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.tripulante.nomeguerra!,
                        style: const TextStyle(color: Colors.green, fontSize: 16.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 50.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 190,
                          color: const Color(0xFF33691E),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              ListTile(
                                title: Text(
                                  "Minha",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.book,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Escala',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "/escala", arguments: widget.tripulante);
                        },
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        child: Container(
                          height: 120,
                          color: Colors.green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              ListTile(
                                title: Text(
                                  "Contatos",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Importantes',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "/contatoEmpresa");
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 120,
                          color: const Color(0xFF1B5E20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              ListTile(
                                title: Text(
                                  "Mensagens",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.mail_outline_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Importantes',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "/mensagensImportantes", arguments: widget.tripulante.id);
                        },
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        child: Container(
                          height: 190,
                          color: const Color(0xFF00C853),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              ListTile(
                                title: Text(
                                  "Diario de",
                                  style:TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.phone_android,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Bordo',
                                  style:TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "/contato", arguments: widget.tripulante);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // GestureDetector(
            //   child: Container(
            //     height: 90,
            //     color: Color(0xFF004D40),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: const <Widget>[
            //         ListTile(
            //           title: Text(
            //             "Central de mensagens",
            //             style:TextStyle(
            //                 color: Colors.white
            //             ),
            //           ),
            //           trailing: Icon(
            //             Icons.mail,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(left: 16.0),
            //           child: Text(
            //             'Clique e veja mensagens do CCO',
            //             style:TextStyle(
            //                 color: Colors.white
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            //   onTap: (){
            //     Navigator.pushNamed(context, "/mensagensImportantes", arguments: widget.tripulante.id);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
