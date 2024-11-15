import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final List<Widget>? actions; // Nuevo parámetro opcional para acciones

  const BaseScaffold({
    super.key,
    required this.body,
    required this.title,
    this.actions, // Inicializar el parámetro
  });

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Manejo de navegación basado en el índice seleccionado
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/edit_profile');
        break;
      case 2:
        Navigator.pushNamed(context, '/notifications');
        break;
      case 3:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 101, 166, 231),
        actions: widget.actions, // Añadir las acciones personalizadas
      ),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 1
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: _selectedIndex == 2
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _selectedIndex == 3
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 40, // Tamaño aumentado de los iconos
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
