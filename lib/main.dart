import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/mapa_page.dart';
import 'pages/ficha_medica_page.dart';
import 'pages/contatos_emergencia_page.dart';

void main() {
  runApp(SOSBombeirosApp());
}

class SOSBombeirosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Bombeiros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/mapa': (_) => MapaPage(),
        '/ficha-medica': (_) => FichaMedicaPage(),
        '/contatos-emergencia': (_) => ContatosEmergenciaPage(),
      },
    );
  }
}
