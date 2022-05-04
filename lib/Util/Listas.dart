import 'package:flutter/material.dart';

class Listas{
  static List<DropdownMenuItem<String>> getResposta(opcao1, opcao2, opcao3, opcao4){
    List<DropdownMenuItem<String>> itensDropCategorias = [];
    //Categorias
    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Selecione a resposta", style: TextStyle(color: Color(0xff9c27b0)),), value: null,)
    );
    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Ativo"), value: "Ativo",)
    );
    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Fazendo"), value: "Fazendo",)
    );
    itensDropCategorias.add(
        DropdownMenuItem(child: Text("Finalizado"), value: "Finalizado",)
    );
    return itensDropCategorias;
  }
}