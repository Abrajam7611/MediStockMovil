import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controlador de tema actual
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    void toggleTheme() {
      final newThemeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    }

    return BaseScaffold(
      title: 'Ajustes',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Botón para alternar entre modo claro y oscuro
            ElevatedButton(
              onPressed: toggleTheme,
              child: Text(isDarkMode ? 'Modo Claro' : 'Modo Oscuro'),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
