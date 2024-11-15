import 'package:flutter/material.dart';
import '../widgets/base_scaffold.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _usernameController = TextEditingController();
  String defaultUsername = "NombreUsuario";

  @override
  void initState() {
    super.initState();
    _usernameController.text = defaultUsername; // Nombre por defecto
  }

  void _saveChanges() {
    setState(() {
      defaultUsername = _usernameController.text;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Editar Perfil',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto de perfil
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue[100],
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'change') {
                          // Cambiar foto (futuro)
                        } else if (value == 'delete') {
                          // Eliminar foto (futuro)
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'change',
                          child: Text('Cambiar Foto'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Eliminar Foto'),
                        ),
                      ],
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.blue[700],
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Campo de nombre de usuario con icono de edición
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Nombre de usuario',
                      prefixIcon: Icon(Icons.person, color: Colors.blue[700]),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.edit,
                  color: Colors.blue[700],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Botón para guardar cambios
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveChanges,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Guardar Cambios',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ), actions: [], 
    );
  }
}