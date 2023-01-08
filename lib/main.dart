
import 'package:digi_bell/home.dart';
import 'package:digi_bell/login.dart';
import 'package:digi_bell/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=> Mylogin(),
      'signup': (context)=> Mysignup(),
      'home': (context) => Myhome(),
    },

  ));
}
