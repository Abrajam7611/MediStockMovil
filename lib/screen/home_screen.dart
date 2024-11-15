import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false; // Controla si estamos en modo búsqueda
  final TextEditingController _searchController = TextEditingController();

  // Lista simulada de medicamentos
  final List<String> _medicamentos = [
    'Paracetamol',
    'Ibuprofeno',
    'Amoxicilina',
    'Loratadina',
    'Ranitidina',
    'Cetirizina',
    'Metformina',
  ];

  // Lista filtrada que se muestra en pantalla
  List<String> _filteredMedicamentos = [];

  @override
  void initState() {
    super.initState();
    _filteredMedicamentos = _medicamentos; // Inicializar con todos los medicamentos
  }

  void _filterMedicamentos(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMedicamentos = _medicamentos;
      } else {
        _filteredMedicamentos = _medicamentos
            .where((medicamento) =>
                medicamento.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: _isSearching ? '' : 'Medicamentos',
      actions: [
        if (_isSearching)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Buscar medicamentos...',
                  border: InputBorder.none,
                ),
                onChanged: _filterMedicamentos, // Actualiza la lista filtrada
              ),
            ),
          ),
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _isSearching = false;
                _searchController.clear();
                _filteredMedicamentos = _medicamentos; // Restablecer lista completa
              } else {
                _isSearching = true;
              }
            });
          },
        ),
      ],
      body: _buildMedicamentosList(), // Construye la lista dinámica
    );
  }

  Widget _buildMedicamentosList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: _filteredMedicamentos.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(_filteredMedicamentos[index]),
            leading: const Icon(Icons.medical_services_outlined),
            onTap: () {
              // Acciones al seleccionar un medicamento (futuro)
              print('Seleccionado: ${_filteredMedicamentos[index]}');
            },
          ),
        );
      },
    );
  }
}
