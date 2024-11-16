import 'package:flutter/material.dart';
import 'package:medistockmovil/screen/edit_profile_screen.dart';
import 'package:medistockmovil/screen/home_screen.dart';
import 'package:medistockmovil/screen/login_screen.dart';
import 'package:medistockmovil/screen/notifications_screen.dart';
import 'package:medistockmovil/screen/search_screen.dart';
import 'package:medistockmovil/screen/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediStock Móvil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Ruta inicial
      initialRoute: '/login', // Renombrar '/' por '/login' para mayor claridad
      // Configuración de rutas
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
