import 'package:flutter/material.dart';
import 'screen/edit_profile_screen.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/notifications_screen.dart';
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
        fontFamily: 'GatteModern', // Configura la fuente globalmente
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      // Ruta inicial
      initialRoute: '/login', // Login será la pantalla inicial
      // Configuración de rutas
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
