import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bienvenido extends StatelessWidget {
  const Bienvenido({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISI-PHONE",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(238, 85, 226, 1), Color.fromRGBO(255, 119, 83, 1)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: ()=>{

            },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()=>{

            },
          ),
        ],
      ),
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(BuildContext context){
  return SingleChildScrollView(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SizedBox(height: 50),

            ],
          ),
      ),
    ),
  );
}