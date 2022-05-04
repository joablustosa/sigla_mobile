// ignore_for_file: file_names, unnecessary_question_mark

import 'package:flutter/material.dart';
import 'package:sigla_mobile/EmpresaLogin.dart';
import 'package:sigla_mobile/Models/Tripulante.dart';
import 'package:sigla_mobile/Views/ContatoCco/ContatoEmpresa.dart';
import 'package:sigla_mobile/Views/ContraCheque/ContraCheque.dart';
import 'package:sigla_mobile/Views/Perfil/MeuPerfil.dart';
import 'EsqueciASenha.dart';
import 'SiglaLogin.dart';
import 'Views/ContatoCco/Contato.dart';
import 'Views/Ead/Ead.dart';
import 'Views/Escala/Escala.dart';
import 'Views/Inicio/Inicio.dart';
import 'Views/Mensagem/MensagensImportantes.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch( settings.name ){
      case "/inicio" :
        return MaterialPageRoute(
            builder: (_) => Inicio(args as Tripulante),
        );
      case "/login" :
        return MaterialPageRoute(
            builder: (_) => SiglaLogin()
        );
      case "/loginEmpresa" :
        return MaterialPageRoute(
            builder: (_) => EmpresaLogin()
        );
      case "/escala" :
        return MaterialPageRoute(
            builder: (_) => Escala(args as Tripulante)
        );
      case "/esqueciASenha" :
        return MaterialPageRoute(
            builder: (_) => EsqueciASenha()
        );
      case "/mensagensImportantes" :
        return MaterialPageRoute(
            builder: (_) => MensagensImportantes(args as double)
        );
      case "/contato" :
        return MaterialPageRoute(
            builder: (_) => Contato(args as Tripulante)
        );
      // case "/simulador" :
      //   return MaterialPageRoute(
      //       builder: (_) => SimuladorDePlacas(args)
      //   );
      // case "/ead" :
      //   return MaterialPageRoute(
      //       builder: (_) => Ead(args as Tripulante)
      //   );
      // case "/simuladorPerguntas" :
      //   return MaterialPageRoute(
      //       builder: (_) => SimuladorPerguntas(args)
      //   );
      case "/meuPerfil" :
        return MaterialPageRoute(
            builder: (_) => MeuPerfil(args as Tripulante)
        );
      // case "/contracheque" :
      //   return MaterialPageRoute(
      //       builder: (_) => ContraCheque()
      //   );
      case "/contatoEmpresa" :
        return MaterialPageRoute(
            builder: (_) => ContatoEmpresa()
        );
      case "/perfil" :
        return MaterialPageRoute(
            builder: (_) => MeuPerfil(args as Tripulante)
        );
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Tela não encontrada!"),
            ),
            body: const Center(
              child: Text("Tela não encontrada!"),
            ),
          );
        }
    );
  }
}