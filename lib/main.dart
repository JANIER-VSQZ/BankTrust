import 'package:banktrust/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import './screen/crearcuenta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //cambiar valor toolbarHeight para reducir tamaño de appBar
        toolbarHeight: 120,
        title: const Text(
          "Iniciar Sesión",
          style: TextStyle(fontSize: 45, color: Color(0xFF328535)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
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
            ),
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
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Ingrese su número",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color(0xFFcce1c6),
                    ),
                  ),
                  const SizedBox(height: 25),

                  const Text("CONTRASEÑA", style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Ingrese su contraseña",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color(0xFFcce1c6),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Falta
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
                      onPressed: () {
                        // Acción de login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF27662A),
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