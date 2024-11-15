import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Ajustes',
      body: Center(
        child: Text(
          'Estoy en ajustes',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
