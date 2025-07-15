import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecuperarContrasena extends StatefulWidget {
  final String cuenta;

  const RecuperarContrasena({super.key, required this.cuenta});

  @override
  State<RecuperarContrasena> createState() => _RecuperarContrasenaState();
}

class _RecuperarContrasenaState extends State<RecuperarContrasena> {
  late TextEditingController cuentaController;
  final TextEditingController contrasenaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cuentaController = TextEditingController(text: widget.cuenta);
  }
//r
  void recuperarContrasena() {
    String cuenta = cuentaController.text;
    String contrasena = contrasenaController.text;

    if (cuenta.isNotEmpty && contrasena.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contraseña cambiada exitosamente')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor complete todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          "¿Ha Olvidado la\nContraseña?",
          style: GoogleFonts.poppins(
            fontSize: 44,
            color: const Color(0xFF328535),
          ),//i
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFEF7FF),
      ),// 28
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Nueva contraseña",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 40),
                const Text("NÚMERO DE CUENTA", style: TextStyle(fontSize: 20)),
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
                const SizedBox(height: 25),
                const Text("NUEVA CONTRASEÑA", style: TextStyle(fontSize: 20)),
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
                ),//2003
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: recuperarContrasena,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF27662A),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                    child: const Text("Cambiar Contraseña"),
                  ),
                ),
              ],
            ),
          ),
        ),//c
      ),
    );
  }//k
}
