import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

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
        '/home': (context) => const HomeScreen(), // Ruta para HomeScreen
        '/login': (context) => const LoginScreen(), // Ruta para LoginScreen
      },
    );
  }
}
