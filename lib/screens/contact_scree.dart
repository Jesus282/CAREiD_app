import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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

  void _errorCambio(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $mensaje'),
        backgroundColor: Colors.red,
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
    // Aquí se podría abrir otra pantalla de recuperación real
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar de Cuenta'),
        centerTitle: true,
      ),
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
                      leading: Icon(Icons.account_circle, color: cuentaSeleccionada == index ? Colors.blue : Colors.grey),
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
