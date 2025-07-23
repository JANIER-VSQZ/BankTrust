import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transaccion {
  String tipo;
  double monto;
  String cuenta;

  Transaccion({required this.tipo, required this.monto, required this.cuenta});
}

class Historialmovimientos extends StatefulWidget {
  const Historialmovimientos({super.key});
  @override
  HistorialmovimientosState createState() => HistorialmovimientosState();
}

enum Opcion { transferencias, pagos, nada }

class HistorialmovimientosState extends State<Historialmovimientos> {
  Opcion _seleccion = Opcion.nada;

  final List<Transaccion> _transaccion = [
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    Transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      body: Column(
        children: [
          // Encabezado estilo perfil
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: const Color(0xFF328535),
            child: Center(
              child: Text(
                'HISTORIAL',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 29.3,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child: cuerpo()),
        ],
      ),
    );
  }

  Widget cuerpo() {
    return Column(
      children: [
        titulo(),
        radio("TRANSFERENCIAS"),
        radio("PAGOS"),
        Expanded(child: textos()),
      ],
    );
  }

  Widget titulo() {
    return Text(
      "Movimientos",
      style: GoogleFonts.poppins(fontSize: 45, color: const Color(0xFF328535)),
    );
  }

  Widget textos() {
    List<Transaccion> transaccionesFiltradas = _transaccion.where((t) {
      return t.tipo ==
          (_seleccion == Opcion.transferencias
              ? 'TRANSFERENCIA'
              : _seleccion == Opcion.pagos
              ? 'PAGO'
              : 'Nada');
    }).toList();

    if (transaccionesFiltradas.isEmpty) {
      return Center(
        child: Text(
          "Por favor, seleccione una opcion",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: transaccionesFiltradas.length,
      itemBuilder: (context, index) {
        final t = transaccionesFiltradas[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: Row(
            children: [
              Image.asset(
                'assets/images/imgHistorial.png',
                width: 30,
                height: 51,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "06/06/25. 13:34:21\n${t.tipo} exitoso! Usted ha Pagado: L.${t.monto}\na la cuenta: ${t.cuenta}",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget radio(var opc) {
    Opcion valorRadio = opc == 'TRANSFERENCIAS'
        ? Opcion.transferencias
        : opc == 'PAGOS'
        ? Opcion.pagos
        : Opcion.nada;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: RadioListTile<Opcion>(
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          opc,
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        value: valorRadio,
        groupValue: _seleccion,
        onChanged: (Opcion? nuevoValor) {
          setState(() {
            _seleccion = nuevoValor!;
          });
        },
      ),
    );
  }
}
