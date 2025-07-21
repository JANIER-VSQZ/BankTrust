import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class Pagarservicios extends StatefulWidget {
  const Pagarservicios({super.key});

  @override
  _PagarserviciosState createState() => _PagarserviciosState();
}

class _PagarserviciosState extends State<Pagarservicios> {
  final List<String> _opciones = [
    'Agua',
    'Luz',
    'Internet',
    'Seguro Medico',
    'Seguro Vehicular',
  ];
  var cuentaOrigen;
  var cantpagar;
  var _seleccion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFF328535),
              child: Center(
                child: Text(
                  'PAGO DE SERVICIOS',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 29.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Datos',
              style: GoogleFonts.poppins(
                fontSize: 45,
                color: Color(0xFF328535),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CUENTA DE ORIGEN:',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: cuentaOrigen,
                decoration: const InputDecoration(
                  enabled: false,
                  labelText: "123",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 222, 222, 222),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SERVICIO:',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xFFcce1c6),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text("Elija una opcion"),
                            iconEnabledColor: Colors.white,
                            underline: const SizedBox(),
                            dropdownColor: const Color(0xFFcce1c6),
                            value: _seleccion,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            items: _opciones.map((String valor) {
                              return DropdownMenuItem<String>(
                                value: valor,
                                child: Text(valor),
                              );
                            }).toList(),
                            onChanged: (String? nuevoValor) {
                              setState(() {
                                _seleccion = nuevoValor;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CANTIDAD A PAGAR:',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: cantpagar,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  enabled: true,
                  labelText: "L.0.00",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color(0xFFcce1c6),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: mtdTransferencia,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27662A),
                  foregroundColor: Colors.white,
                  textStyle: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                child: const Text("Confirmar Pago"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mtdTransferencia() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Pago realizado con éxito')));
  }
}
