import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicati
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
        title: Text(
          "Pagina para Iniciar Sesion",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "¡Bienvenido a BANK TRUST!", //Nomas para probar
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //Falta para irse a home
              },
              child: Text("Ingresar y ver el Icono de Brayan la Cabra"),
            ),
          ],
        ),
      ),
    );
  }
}
