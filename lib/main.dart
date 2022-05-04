import 'package:flutter/material.dart';
import 'RouteGenerator.dart';


final ThemeData temaPadrao = ThemeData(
    primaryColor: Colors.orange,
    secondaryHeaderColor: Colors.orangeAccent
);

void main() => runApp(MaterialApp(
  title: "Sigla Mobile",
  theme: temaPadrao,
  initialRoute: "/login",
  onGenerateRoute: RouteGenerator.generateRoute,
  debugShowCheckedModeBanner: false,
));