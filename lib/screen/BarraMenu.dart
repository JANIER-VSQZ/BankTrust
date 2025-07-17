import 'package:banktrust/screen/historialmovimientos.dart';
import 'package:banktrust/screen/perfil.dart';
import 'package:banktrust/screen/recuperarcontrasena.dart';
import 'package:banktrust/screen/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:banktrust/main.dart';

class Barramenu extends StatefulWidget {
  const Barramenu({Key? key}) : super(key: key);

  @override
  State<Barramenu> createState() => _BarraMenuState();
}

class _BarraMenuState extends State<Barramenu> {
  int _paginaActual = 2;

  final List<Widget> _paginas = [
    RecuperarContrasena(cuenta: "123"),
    Transferencias(cuenta: "123"),
    Perfil(),
    Historialmovimientos(),
    IniciarSesion(),
  ];

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 60,
        backgroundColor: const Color(0xFFFEF7FF),
        color: const Color(0xFF328535),
        buttonBackgroundColor: const Color(0xFF55A14E),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        index: _paginaActual,
        items: const <Widget>[
          Icon(Icons.payment, size: 30, color: Colors.white),
          Icon(Icons.swap_horiz, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.history, size: 30, color: Colors.white),
          Icon(Icons.logout, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          if (index == 4) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const IniciarSesion()),
              (Route<dynamic> route) => false,
            );
          } else {
            setState(() {
              _paginaActual = index;
            });
          }
        },
      ),
    );
  }
}
