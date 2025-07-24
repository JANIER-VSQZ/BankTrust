import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:banktrust/screen/recuperarcontrasena.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:banktrust/sesion.dart';

final usuario = Sesion.usuarioActual;

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _paginaActual = 2;

  @override
  Widget build(BuildContext context) {
    final usuario = Sesion.usuarioActual;

    if (usuario == null) {
      return Scaffold(
        body: Center(
          child: Text(
            'No hay usuario activo',
            style: GoogleFonts.poppins(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              color: const Color(0xFF328535),
              child: Center(
                child: Text(
                  'PERFIL',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 29.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Color(0xFF328535),
            ),
            const SizedBox(height: 10),
            Text(
              usuario.nombre,
              style: GoogleFonts.poppins(
                fontSize: 45,
                color: Color(0xFF328535),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              usuario.cuenta,
              style: GoogleFonts.dmSans(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SALDO',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                enabled: false,
                controller: TextEditingController(
                  //text: 'L ${usuario.saldo.toStringAsFixed(2)}',
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 222, 222, 222),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecuperarContrasena(cuenta: usuario.cuenta),
                  ),
                );
              },
              child: Text(
                'Cambiar contraseña',
                style: GoogleFonts.dmSans(
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
