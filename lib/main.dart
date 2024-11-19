import 'package:flutter/material.dart';
import 'screen/edit_profile_screen.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/notifications_screen.dart';
import 'screen/settings_screen.dart';
import 'screen/splash_screen.dart'; // Importa el Splash Screen

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

      // Ruta inicial: SplashScreen
      initialRoute: '/splash',

      // Configuración de rutas
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
