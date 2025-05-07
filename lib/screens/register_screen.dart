import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _confirmarContrasenaController = TextEditingController();

  bool _isLoading = false;

  Future<void> registrarUsuario() async {
    final supabase = Supabase.instance.client;
    final hashedPassword = sha256.convert(utf8.encode(_contrasenaController.text)).toString();

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

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(_correoController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un correo válido')),
      );
      return;
    }

    if (_telefonoController.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El número de teléfono debe tener al menos 10 dígitos')),
      );
      return;
    }

    if (_contrasenaController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('La contraseña debe tener al menos 6 caracteres')),
      );
      return;
    }

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
      final AuthResponse response = await supabase.auth.signUp(
        email: _correoController.text,
        password: _contrasenaController.text,
      );

      final user = response.user;

      if (user == null) {
        throw Exception("No se pudo registrar el usuario.");
      }

      await supabase.from('newusuarios').insert({
        'id': user.id,
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text,
        'contrasena': hashedPassword,
      });

      _nombreController.clear();
      _correoController.clear();
      _telefonoController.clear();
      _contrasenaController.clear();
      _confirmarContrasenaController.clear();

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('¡Registro exitoso!'),
          content: Text('Tu cuenta ha sido creada correctamente.'),
          actions: [
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );

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
              // Encabezado de registro con una fuente estilizada
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF0288D1), // Azul primario
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Text(
                  "Regístrate",
                  style: GoogleFonts.poppins(  // Usando una fuente moderna y amigable
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Color blanco para el texto
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Campos de entrada con bordes redondeados y iconos
              TextField(
                controller: _nombreController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  hintText: "Nombre",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.person, color: Color(0xFF0288D1)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _correoController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  hintText: "Correo electrónico",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.email, color: Color(0xFF0288D1)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _telefonoController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  hintText: "Teléfono",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.phone, color: Color(0xFF0288D1)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _contrasenaController,
                obscureText: true,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF0288D1)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _confirmarContrasenaController,
                obscureText: true,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  hintText: "Confirmar contraseña",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF0288D1)),
                ),
              ),
              const SizedBox(height: 20),

              // Botón de registro estilizado
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0288D1), // Azul primario
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: Color(0xFF0288D1).withOpacity(0.4),
                        elevation: 5,
                      ),
                      onPressed: registrarUsuario,
                      child: const Text(
                        "Registrarse",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
              const SizedBox(height: 15),

              // Opción de iniciar sesión
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  "¿Ya tienes cuenta? Inicia sesión",
                  style: TextStyle(color: Color(0xFF0288D1)), // Azul primario
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
