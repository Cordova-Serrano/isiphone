import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bienvenido.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(BuildContext context) {
  return SingleChildScrollView(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            logo(),
            titulo(),
            const SizedBox(height: 15),
            texto(),
            const SizedBox(height: 5),
            campoUsuario(),
            campoEmail(),
            campoPassword(),
            const SizedBox(height: 20),
            botonContinuar(context),
          ],
        ),
      ),
    ),
  );
}

Widget logo() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 5),
    child: Image.asset('assets/images/Logo Icono.png'),
  );
}

Widget titulo() {
  return Text(
    "Te damos la bienvenida a ISI-PHONE",
    style: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 27.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textAlign: TextAlign.center,
  );
}

Widget texto() {
  return Container(
    // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Text(
      "Encuentra nuevas ideas para experimentar",
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget campoUsuario() {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 50, vertical: 5), //TAMAÑO DE LA CAJA DE NOMBRE DE USUARIO

    child: const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(239, 235, 235, 1),
            width: 3.0,
          ),
        ),
        hintText: "Nombre de usuario",
        fillColor: Color.fromRGBO(239, 235, 235, 1),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget campoEmail() {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 50, vertical: 5), //TAMAÑO DE LA CAJA DE NOMBRE DE USUARIO

    child: const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(239, 235, 235, 1),
            width: 3.0,
          ),
        ),
        hintText: "Correo electrónico",
        fillColor: Color.fromRGBO(239, 235, 235, 1),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget campoPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 50, vertical: 5), //TAMAÑO DE LA CAJA DE NOMBRE DE USUARIO

    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(239, 235, 235, 1),
            width: 3.0,
          ),
        ),
        hintText: "Contraseña",
        fillColor: Color.fromRGBO(239, 235, 235, 1),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget botonContinuar(BuildContext context) {
  return FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    color: Color.fromRGBO(116, 28, 188, 1),
    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
    onPressed: () => {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Bienvenido()),
      )
    },
    child: Text(
      "Continuar",
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
