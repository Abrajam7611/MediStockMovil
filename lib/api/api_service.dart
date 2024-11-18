import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProductos() async {
  final response = await http.get(
    Uri.parse('http://127.0.0.1:8000/productos/'),
  );

  if (response.statusCode == 200) {
    // Convierte el cuerpo de la respuesta en una lista
    return json.decode(response.body);
  } else {
    throw Exception('Error al cargar productos');
  }
}
