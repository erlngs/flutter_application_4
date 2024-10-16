import 'package:flutter/material.dart';
import 'package:flutter_application_4/register_page.dart';
import 'package:flutter_application_4/login_page.dart';

void main (){
  runApp( Myapp());
}

class Myapp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login/Register Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/Register' : (context) => RegisterPage(),
      },
    );
  }
}