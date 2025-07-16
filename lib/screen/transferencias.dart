import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transferencias extends StatefulWidget {
  final String cuenta;

  const Transferencias({super.key, required this.cuenta});

  @override
  State<Transferencias> createState() => _TransferenciasState();
}

class _TransferenciasState extends State<Transferencias> {
  late TextEditingController cuentaController;
  final TextEditingController contrasenaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cuentaController = TextEditingController(text: widget.cuenta);
  }

  // void recuperarContrasena() {
  //   String cuenta = cuentaController.text;
  //   String contrasena = contrasenaController.text;

  //   if (cuenta.isNotEmpty && contrasena.isNotEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Contraseña cambiada exitosamente')),
  //     );
  //     Navigator.pop(context);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Por favor complete todos los campos')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          "Datos",
          style: GoogleFonts.poppins(
            fontSize: 44,
            color: const Color(0xFF328535),
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFEF7FF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                // const Align(
                //   alignment: Alignment.center,
                //   child: Text(
                //     "Nueva contraseña",
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),
                const SizedBox(height: 40),
                const Text("CUENTA DE ORIGEN:", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 5),
                TextField(
                  controller: cuentaController,
                  decoration: const InputDecoration(
                    labelText: "123123123123",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFcce1c6),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "CUENTA DE DESTINO:",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: contrasenaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Escriba aquí la cuenta de destino",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFcce1c6),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "MONTO DE TRANSFERENCIA:",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: contrasenaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Escriba aquí el monto que desea transferir",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFcce1c6),
                  ),
                ),
                const SizedBox(height: 25),
                const Text("CONCEPTO:", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 5),
                TextField(
                  controller: contrasenaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText:
                        "Por favor escriba un concepto para la transacción",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color(0xFFcce1c6),
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
