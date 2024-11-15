// lib/screens/search_screen.dart
import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Buscar',
      body: Center(
        child: Text(
          'Buscar',
          style: TextStyle(fontSize: 20),
        ),
      ), actions: [], 
    );
  }
}