import 'package:flutter/material.dart';
import 'package:medistockmovil/screen/home_screen.dart';
import 'package:medistockmovil/screen/login_screen.dart';
// Importar la pantalla de inicio

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediStock Movil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(), // Pantalla inicial
      routes: {
        '/home': (context) => const HomeScreen(), // Definir la ruta para HomeScreen
      },
    );
  }
}