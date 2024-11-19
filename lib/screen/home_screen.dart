import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/base_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false; // Controla si estamos en modo búsqueda
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> _medicamentos = []; // Lista de medicamentos desde la API
  List<dynamic> _filteredMedicamentos = []; // Lista filtrada que se muestra en pantalla
  bool _isLoading = true; // Controla si estamos cargando datos
  String _errorMessage = ''; // Almacena errores de la carga

  @override
  void initState() {
    super.initState();
    _fetchMedicamentos(); // Cargar medicamentos desde la API al iniciar
  }

  Future<void> _fetchMedicamentos() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/productos/'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _medicamentos = json.decode(response.body);
          _filteredMedicamentos = _medicamentos; // Inicializar lista filtrada
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Error al cargar productos: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al cargar productos: $e';
        _isLoading = false;
      });
    }
  }

  void _filterMedicamentos(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMedicamentos = _medicamentos;
      } else {
        _filteredMedicamentos = _medicamentos
            .where((medicamento) =>
                medicamento['nombre']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )
              : _buildMedicamentosList(), // Construye la lista dinámica
    );
  }

  Widget _buildMedicamentosList() {
    return _filteredMedicamentos.isEmpty
        ? const Center(
            child: Text(
              'No se encontraron medicamentos.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _filteredMedicamentos.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  title: Text(
                    _filteredMedicamentos[index]['nombre'] ?? 'Sin nombre',
                    style: const TextStyle(fontSize: 16),
                  ),
                  leading: const Icon(Icons.medical_services_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Acciones al seleccionar un medicamento
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Seleccionaste: ${_filteredMedicamentos[index]['nombre']}',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
  }
}
