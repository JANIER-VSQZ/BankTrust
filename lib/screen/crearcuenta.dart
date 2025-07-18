import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});

  @override
  State<CrearCuenta> createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  final TextEditingController cuentaController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();

  void crearCuenta() {
    String cuenta = cuentaController.text;
    String contrasena = contrasenaController.text;
    String nombre = nombreController.text;
    String apellido = apellidoController.text;

    if (cuenta.isNotEmpty &&
        contrasena.isNotEmpty &&
        nombre.isNotEmpty &&
        apellido.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuenta creada exitosamente')),
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
      backgroundColor: Color(0xFFFEF7FF),
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          "Crear Cuenta",
 style: GoogleFonts.poppins (fontSize: 45, color: Color(0xFF328535)),         
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFFEF7FF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Complete el formulario para registrarse",
                    style: GoogleFonts.dmSans(
                  fontSize: 18, 
                  color: Color(0xFF8F8E8E),
                  ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "NÚMERO DE CUENTA",
                  style: GoogleFonts.dmSans(fontSize: 20, color: Color(0xFF8F8E8E) ),
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
                const SizedBox(height: 25),
                Text(
                  "CONTRASEÑA",
                  style: GoogleFonts.dmSans(fontSize: 20, color: Color(0xFF8F8E8E) ),
                ),
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
                const SizedBox(height: 25),
                Text(
                  "NOMBRE",
                  style: GoogleFonts.dmSans(fontSize: 20, color: Color(0xFF8F8E8E) ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    labelText: "Ingrese su nombre",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFcce1c6),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "APELLIDO",
                  style: GoogleFonts.dmSans(fontSize: 20, color: Color(0xFF8F8E8E) ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: apellidoController,
                  decoration: const InputDecoration(
                    labelText: "Ingrese su apellido",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFcce1c6),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: crearCuenta,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF27662A),
                      foregroundColor: Colors.white,
                      textStyle: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                    child: const Text("Crear Cuenta"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
