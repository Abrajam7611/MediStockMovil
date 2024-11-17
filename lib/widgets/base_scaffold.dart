import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final List<Widget>? actions;

  const BaseScaffold({
    super.key,
    required this.body,
    required this.title,
    this.actions,
  });

  @override
  BaseScaffoldState createState() => BaseScaffoldState();
}

class BaseScaffoldState extends State<BaseScaffold> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/home',
    '/edit_profile',
    '/notifications',
    '/settings',
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Evita recargar la misma pantalla

    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 101, 166, 231),
        actions: widget.actions,
      ),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Color del ícono seleccionado
        unselectedItemColor: Colors.grey.withOpacity(0.5), // Color de íconos no seleccionados
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
