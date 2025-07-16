import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:banktrust/main.dart';
import 'package:banktrust/screen/recuperarcontrasena.dart';

class Usuario {
  final String nombre;
  final String cuenta;
  final double saldo;

  Usuario({required this.nombre, required this.cuenta, required this.saldo});
}

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _paginaActual = 2;

  // Datos relleno
  final Usuario usuario = Usuario(
    nombre: 'Jana Martín',
    cuenta: '0685200026542',
    saldo: 100000.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFF328535),
              child: const Center(
                child: Text(
                  'PERFIL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
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
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF328535),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              usuario.cuenta,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SALDO',
                  style: TextStyle(
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
                  text: 'L ${usuario.saldo.toStringAsFixed(2)}',
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
              child: const Text(
                'Cambiar contraseña',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
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
          setState(() {
            _paginaActual = index;
          });

          // Navegación futura
          switch (index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              // Perfil (actual)
              break;
            case 3:
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecuperarContrasena(cuenta: usuario.cuenta),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
