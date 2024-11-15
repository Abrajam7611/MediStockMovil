// lib/screens/notifications_screen.dart
import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Notificaciones',
      body: Center(
        child: Text(
          'Notificaciones',
          style: TextStyle(fontSize: 20),
        ),
      ), actions: [], 
    );
  }
}