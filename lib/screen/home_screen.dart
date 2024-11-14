// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Inicio',
      body: Center(
        child: Text(
          'Bienvenido a la Página de Inicio',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}