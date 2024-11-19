import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3)); // Espera 3 segundos
    Navigator.pushReplacementNamed(context, '/login'); // Navega al login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Asegúrate de tener el logo en assets
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'MediStock Móvil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Cambia el color si es necesario
              ),
            ),
          ],
        ),
      ),
    );
  }
}
