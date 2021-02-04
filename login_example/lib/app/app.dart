import 'package:login_example/view/splashScreen.dart'; //Importamos el splash
import 'package:flutter/material.dart';


class App extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: SplashScreen(),
    );
  }
}
