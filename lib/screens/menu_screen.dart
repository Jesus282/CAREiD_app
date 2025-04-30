import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';
import 'package:login/Actions/utils.dart' show Appointment, CalendarScreen;
import 'package:intl/intl.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Appointment> medicalAppointments = [];
  int _currentBottomNavIndex = 0;

  void _showAddAppointmentDialog() {
    final appointmentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => _buildAppointmentDialog(appointmentController),
    );
  }

  void _addNewAppointment(TextEditingController controller) {
    final appointmentText = controller.text.trim();
    if (appointmentText.isNotEmpty) {
      setState(() {
        medicalAppointments.add(
          Appointment(
            title: appointmentText,
            date: DateTime.now(),
          ),
        );
      });
      Navigator.pop(context);
    }
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
          onPressed: () => _addNewAppointment(controller),
          child: const Text('AGREGAR'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        scaffoldKey: _scaffoldKey,
        currentIndex: _currentBottomNavIndex,
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
                    title: Text(medicalAppointments[index].title),
                    subtitle: Text(
                      'Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(medicalAppointments[index].date)}',
                    ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddAppointmentDialog,
        child: const Icon(Icons.add),
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
