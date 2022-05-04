import 'package:flutter/material.dart';
import 'package:sigla_mobile/Models/Tripulante.dart';

class Perfil extends StatefulWidget {
  Tripulante tripulante;
  Perfil(this.tripulante);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil",
          style: TextStyle(
            color: Colors.white,
          ),),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
