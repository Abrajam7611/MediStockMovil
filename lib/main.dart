
import 'package:flutter/material.dart';

import 'screen/edit_profile_screen.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/notifications_screen.dart';
import 'screen/search_screen.dart';
import 'screen/settings_screen.dart';

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
      // Definimos la ruta inicial como LoginScreen
      initialRoute: '/',
      // Configuración de rutas
      routes: {
        '/': (context) => const LoginScreen(),  // Ruta inicial que muestra la pantalla de login
        '/home': (context) => const HomeScreen(),      // Ruta de la pantalla de inicio
        '/edit_profile': (context) => const EditProfileScreen(),  // Ruta de la pantalla de editar perfil
        '/search': (context) => const SearchScreen(),  // Ruta de la pantalla de búsqueda
        '/notifications': (context) => const NotificationsScreen(), // Ruta de la pantalla de notificaciones
        '/settings': (context) => const SettingsScreen(), // Agrega la ruta
      },
    );
  }
}