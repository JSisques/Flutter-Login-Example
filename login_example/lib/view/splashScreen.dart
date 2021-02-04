import 'dart:async';

import 'package:login_example/view/loginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  //Creamos un temporizador para el splash
  Timer timer;

  //Metodo para crear la ventana del Splash (onCreate() en android)
  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), onShowLogin);
  }

  //Metodo para eliminar la ventana del splash
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //Metodo para navegar al login
  void onShowLogin() {
    //Si el view ya se ha creado
    if(mounted){
      //Navega a la siguiente ventana y hace un dispose de la que se encuentra actualmente
      Navigator.of(context).pushReplacement(LoginScreen.route());
    }
  }

  //Creamos el widget (la UI)
  @override
  Widget build(BuildContext context) {
    return Material(
      //color: Colors.grey[600], //Para crear un filtro de color gris en la pantalla
      child: Column(
        children: <Widget>[
          SizedBox(height: 100.0,),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                //child: Image.asset('assets/argelbejarano.png'),
                child: Image.network('https://picsum.photos/250?image=9'), //Para mostrar una imagen desde internet o un gif
              ),
            ),
          ),
          Text(
            'Bienvenido',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator( //El circulo de carga
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  strokeWidth: 6, //Grosor de la linea
                  key: null, //Indicamos que es un progressbar indefinido
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

