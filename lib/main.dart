import 'package:banktrust/screen/BarraMenu.dart';
import 'package:banktrust/screen/recuperarcontrasena.dart';
import 'package:banktrust/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import './screen/crearcuenta.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen/perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({Key? key}) : super(key: key);

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final TextEditingController cuentaController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  void validarInicioSesion() {
    final cuenta = cuentaController.text.trim();
    final contrasena = contrasenaController.text.trim();

    if (cuenta.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor complete todos los campos')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Inicio de sesión exitoso')));

      Future.delayed(const Duration(seconds: 0), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Barramenu()),
        );//r
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          "Iniciar Sesión",//i
          style: GoogleFonts.poppins(
            fontSize: 45,
            color: const Color(0xFF328535),
          ),
        ),
        centerTitle: true,
        elevation: 0,//c
        backgroundColor: const Color(0xFFFEF7FF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Inicia sesión para continuar",
                style: TextStyle(fontSize: 18),
              ),
            ),//k
            const SizedBox(height: 80),
            SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "NÚMERO DE CUENTA",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: cuentaController,
                    decoration: const InputDecoration(
                      labelText: "Ingrese su número",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color(0xFFcce1c6),
                    ),
                  ),
                  const SizedBox(height: 25),//28
                  const Text("CONTRASEÑA", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  TextField(
                    controller: contrasenaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Ingrese su contraseña",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color(0xFFcce1c6),
                    ),
                  ),
                  const SizedBox(height: 30),//2003
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            String cuenta = cuentaController.text.trim();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecuperarContrasena(cuenta: cuenta),
                              ),
                            );
                          },
                          child: const Text(
                            "¿Olvidó la Contraseña?",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CrearCuenta(),
                              ),
                            );
                          },
                          child: const Text(
                            "Crear Cuenta",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: validarInicioSesion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF27662A),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      child: const Text("Iniciar Sesión"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
