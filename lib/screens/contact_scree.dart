import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Navegación según el índice
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/menu');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/location');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
    }
  }

  List<String> cuentas = ['Cuenta Principal', 'Cuenta Secundaria'];
  int cuentaSeleccionada = -1;

  void _confirmarCambio(String accion) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Acción: $accion realizada exitosamente.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _cerrarSesion() {
    setState(() {
      cuentaSeleccionada = -1;
    });
    _confirmarCambio('Cierre de sesión');
  }

  void _crearNuevaCuenta() {
    setState(() {
      cuentas.add('Nueva Cuenta ${cuentas.length + 1}');
    });
    _confirmarCambio('Creación de nueva cuenta');
  }

  void _recuperarCuenta() {
    _confirmarCambio('Recuperación de cuenta');
  }

  void _cambiarCuenta(int index) {
    setState(() {
      cuentaSeleccionada = index;
    });
    _confirmarCambio('Cambio a ${cuentas[index]}');
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey,
      currentIndex: _currentIndex,
      onBottomNavTapped: _onBottomNavTapped,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cuentas Disponibles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cuentas.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: cuentaSeleccionada == index ? Colors.blue : Colors.grey,
                      ),
                      title: Text(cuentas[index]),
                      trailing: cuentaSeleccionada == index
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : null,
                      onTap: () => _cambiarCuenta(index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _crearNuevaCuenta,
              icon: const Icon(Icons.person_add),
              label: const Text('Crear Nueva Cuenta'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _cerrarSesion,
              icon: const Icon(Icons.logout),
              label: const Text('Cerrar Sesión'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _recuperarCuenta,
              icon: const Icon(Icons.lock_open),
              label: const Text('Recuperar Cuenta'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
