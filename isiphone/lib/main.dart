import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isiphone/pages/bienvenido.dart';
import 'package:isiphone/pages/registro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List usuarios = [];
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");

    QuerySnapshot users = await collectionReference.get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        print(doc.data());
        usuarios.add(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(BuildContext context) {
  return SingleChildScrollView(
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 80),
        logo(),
        nombre(),
        const SizedBox(height: 15),
        texto(),
        campoUsuario(),
        campoPassword(),
        const SizedBox(height: 20),
        botonEntrar(context),
        const SizedBox(height: 16),
        separacion(),
        const SizedBox(height: 16),
        noTienesCuentaTxt(),
        botonRegistro(context),
      ],
    )),
  );
}

Widget logo() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 5),
    child: Image.asset('assets/images/Logo Icono.png'),
  );
}

Widget nombre() {
  return Text(
    "ISI-PHONE",
    style: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget texto() {
  return Container(
    // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Text(
      "Iniciar Sesión",
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
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

Widget botonEntrar(BuildContext context) {
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
      "Iniciar Sesión",
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

Widget separacion() {
  return Row(
    children: [
      Expanded(child: Divider()),
      Text(
        "Ó",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(child: Divider()),
    ],
  );
}

Widget noTienesCuentaTxt() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Text(
      "¿No tienes cuenta?",
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget botonRegistro(BuildContext context) {
  return FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    color: Color.fromRGBO(116, 28, 188, 1),
    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
    onPressed: () => {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Registro()),
      )
    },
    child: Text(
      "Regístrate",
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
