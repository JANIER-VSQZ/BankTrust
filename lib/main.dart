import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IniciarSesion(),
    );
  }
}

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Iniciar Sesión",
          style: TextStyle(fontSize: 45, color: Color(0xFF328535)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 20), // Separación debajo del título
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Inicia sesión para continuar",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),

            // Número de cuenta
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("NÚMERO DE CUENTA", style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                labelText: "Ingrese su número",
                border: OutlineInputBorder(),
                filled: true, // <- activa el fondo
                fillColor: Color(
                  0xFFcce1c6,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Contraseña
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("CONTRASEÑA", style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                labelText: "Ingrese su contrasema",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(
                  0xFFcce1c6,
                ),
              ),
            ),

            const Spacer(), // para mandar el botón hacia abajo

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Falta la de inisicar sesion
                },
                child: const Text("Ingresar y ver el Icono de Brayan la Cabra"),
              ),
            ),
            const SizedBox(height: 20), // espacio de abajo
          ],
        ),
      ),
    );
  }
}
