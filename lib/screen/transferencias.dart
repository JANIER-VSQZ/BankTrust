import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:banktrust/screen/historialmovimientos.dart';
import 'package:banktrust/screen/perfil.dart';

class Transferencias extends StatefulWidget {
  final String cuenta;

  const Transferencias({super.key, required this.cuenta});

  @override
  State<Transferencias> createState() => _TransferenciasState();
}

class _TransferenciasState extends State<Transferencias> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _paginaActual = 1;

  late TextEditingController cuentaOrigen = TextEditingController(
    text: widget.cuenta,
  );

  late TextEditingController cuentaDestino = TextEditingController();
  late TextEditingController monto = TextEditingController();
  late TextEditingController concepto = TextEditingController();

  @override
  void initState() {
    super.initState();
    cuentaDestino = TextEditingController(text: widget.cuenta);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navBarState = _bottomNavigationKey.currentState;
      navBarState?.setPage(1); // or any other index you want
    });
  }

  void mtd_transferencia() {
    String vrCuentaDestino = cuentaDestino.text;
    String vrMonto = monto.text;
    String vrConcepto = concepto.text;

    if (vrCuentaDestino.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor escriba la cuenta de destino')),
      );
    } else if (vrMonto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor escriba el monto a transferir'),
        ),
      );
    } else if (vrConcepto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor escriba un pequeño concepto para la transacción',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La transferencia ha sido exitosa!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      // appBar: AppBar(
      //   toolbarHeight: 120,
      //   title: Text(
      //     "Datos",
      //     style: GoogleFonts.poppins(
      //       fontSize: 44,
      //       color: const Color(0xFF328535),
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: const Color(0xFFFEF7FF),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFF328535),
              child: const Center(
                child: Text(
                  'REALIZAR TRANSFERENCIA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 40),
            const Text("CUENTA DE ORIGEN:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: cuentaOrigen,
                decoration: const InputDecoration(
                  enabled: false,
                  labelText: "Cuenta de origen",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color(0xFFcce1c6),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text("CUENTA DE DESTINO:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: cuentaDestino,
                // obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Escriba aquí la cuenta de destino",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color(0xFFcce1c6),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "MONTO DE TRANSFERENCIA:",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: monto,
                // obscureText: true,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ],
                decoration: const InputDecoration(
                  labelText: "Escriba aquí el monto que desea transferir",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color(0xFFcce1c6),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text("CONCEPTO:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: concepto,
                // obscureText: true,
                decoration: const InputDecoration(
                  labelText:
                      "Por favor escriba un concepto para la transacción",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color(0xFFcce1c6),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: mtd_transferencia,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27662A),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                child: const Text("Realizar transacción"),
              ),
            ),
            const SizedBox(height: 40),
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
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => Perfil()),
              // );
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => Perfil(),
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: Duration.zero,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                ),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => historialmovimientos(),
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: Duration.zero,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                ),
              );
              break;
            case 4:
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         RecuperarContrasena(cuenta: usuario.cuenta),
              //   ),
              // );
              break;
          }
        },
      ),
    );
  }
}
