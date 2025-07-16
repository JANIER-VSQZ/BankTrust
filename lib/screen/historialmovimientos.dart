import 'package:banktrust/screen/perfil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banktrust/screen/recuperarcontrasena.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class transaccion {
  String tipo;
  double monto;
  String cuenta;

  transaccion({required this.tipo, required this.monto, required this.cuenta});
}

class historialmovimientos extends StatefulWidget {
  const historialmovimientos({super.key});
  @override
  HistorialmovimientosState createState() => HistorialmovimientosState();
}

enum Opcion { transferencias, pagos, nada }

class HistorialmovimientosState extends State<historialmovimientos> {
  Opcion _seleccion = Opcion.nada;

  final List<transaccion> _transaccion = [
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "PAGO", monto: 12000, cuenta: "ENEE"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
    transaccion(tipo: "TRANSFERENCIA", monto: 13000, cuenta: "123456789"),
  ];

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int _paginaActual = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          "Historial",
          style: GoogleFonts.poppins(
            fontSize: 45,
            color: const Color(0xFF328535),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFEF7FF),
      ),
      body: cuerpo(),
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
              );
              break;
            case 3:
              //hitorial pagina actual
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RecuperarContrasena(cuenta: "123"),
                ),
              );
              break;
          }
        },
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
    List<transaccion> transaccionesFiltradas = _transaccion.where((t) {
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
        title: Text(opc),
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
