import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> medicalAppointments = [];
  int _currentBottomNavIndex = 0;

  // Método para mostrar diálogo de nueva cita
  void _showAddAppointmentDialog() {
    final appointmentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => _buildAppointmentDialog(appointmentController),
    );
  }

  Widget _buildAppointmentDialog(TextEditingController controller) {
    return AlertDialog(
      title: const Text('Agendar Nueva Cita'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Ej: Consulta con Cardiología',
          labelText: 'Nombre de la cita',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCELAR'),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              setState(() {
                medicalAppointments.add(controller.text.trim());
              });
              Navigator.pop(context);
            }
          },
          child: const Text('AGREGAR'),
        ),
      ],
    );
  }

  // Método para construir el botón flotante CORREGIDO
  FloatingActionButton _buildAddButton() {
    return FloatingActionButton(
      onPressed: _showAddAppointmentDialog,
      backgroundColor: Colors.blueAccent,
      child: const Icon(Icons.add, size: 28),
      tooltip: 'Agregar cita',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey,
      currentIndex: _currentBottomNavIndex,
      floatingActionButton: _buildAddButton(), // Ahora recibe un FloatingActionButton directamente
      body: medicalAppointments.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: medicalAppointments.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.medical_services, color: Colors.white),
                  ),
                  title: Text(medicalAppointments[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => Navigator.pushNamed(context, '/perfilconsulta'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => setState(() {
                          medicalAppointments.removeAt(index);
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No tienes citas programadas'),
        ],
      ),
    );
  }
}