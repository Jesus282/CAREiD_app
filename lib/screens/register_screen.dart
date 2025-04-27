import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart'; // Import para manejar formatos de entrada

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _confirmarContrasenaController = TextEditingController();

  bool _isLoading = false; // Para mostrar un indicador de carga

  Future<void> registrarUsuario() async {
    final supabase = Supabase.instance.client;
    final hashedPassword = sha256.convert(utf8.encode(_contrasenaController.text)).toString();

    // --- Validación de campos ---
    if (_nombreController.text.isEmpty ||
        _correoController.text.isEmpty ||
        _telefonoController.text.isEmpty ||
        _contrasenaController.text.isEmpty ||
        _confirmarContrasenaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, llena todos los campos')),
      );
      return;
    }

    // --- Validación de correo electrónico básico ---
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(_correoController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un correo válido')),
      );
      return;
    }

    // --- Validación de teléfono (mínimo 10 dígitos) ---
    if (_telefonoController.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El número de teléfono debe tener al menos 10 dígitos')),
      );
      return;
    }

    // --- Confirmar contraseña ---
    if (_contrasenaController.text != _confirmarContrasenaController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Las contraseñas no coinciden')),
      );
      return;
    }
    
    setState(() {
      _isLoading = true;
    });

    try {
      await supabase.from('usuarios1').insert({
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text,
        'contrasena': hashedPassword,
      });

      // --- Limpiar campos después del registro exitoso ---
      _nombreController.clear();
      _correoController.clear();
      _telefonoController.clear();
      _contrasenaController.clear();
      _confirmarContrasenaController.clear();

      // --- Mostrar un diálogo bonito ---
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('¡Registro exitoso!'),
          content: Text('Tu cuenta ha sido creada correctamente.'),
          actions: [
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
            ),
          ],
        ),
      );

      // --- Navegar a /plan ---
      Navigator.pushReplacementNamed(context, '/plan');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Text(
                  "Regístrate",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  hintText: "Nombre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _correoController,
                decoration: InputDecoration(
                  hintText: "Correo electrónico",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _telefonoController,
                keyboardType: TextInputType.number, // Teclado de números
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Solo permite dígitos
                decoration: InputDecoration(
                  hintText: "Teléfono",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _contrasenaController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _confirmarContrasenaController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirmar contraseña",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: registrarUsuario,
                      child: const Text("Registrarse", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text("¿Ya tienes cuenta? Inicia sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



