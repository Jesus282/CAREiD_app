import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';
import 'package:login/Actions/utils.dart' show Appointment, CalendarScreen;
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:login/screens/profilecosult_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class Appointment {
  final String id;
  final String title;
  final DateTime date;

  Appointment({
    required this.id,
    required this.title,
    required this.date,
  });
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Appointment> medicalAppointments = [];
  int _currentBottomNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final response = await supabase
        .from('appointments')
        .select()
        .eq('user_id', user.id)
        .order('date', ascending: false);

    setState(() {
      medicalAppointments = response
          .map<Appointment>((data) => Appointment(
                id: data['id'].toString(),
                title: data['title'],
                date: DateTime.parse(data['date']),
              ))
          .toList();
    });
  }

  void _navigateToConsultaScreen() async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ConsultaScreen(),
    ),
  );

  if (result != null && result is Map<String, dynamic>) {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final doctor = result['doctor'] as String;
    final purpose = result['purpose'] as String;
    final datetime = result['datetime'] as DateTime;

    try {
      final response = await supabase.from('appointments').insert({
        'title': '$doctor - $purpose',
        'date': datetime.toIso8601String(),
        'user_id': user.id,
      }).select();

      final inserted = response.first;

      setState(() {
        medicalAppointments.insert(
          0,
          Appointment(
            id: inserted['id'].toString(),
            title: '$doctor - $purpose',
            date: datetime,
          ),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar la cita: $e')),
      );
    }
  }
}


  Future<void> _addNewAppointment(TextEditingController controller) async {
    final appointmentText = controller.text.trim();
    if (appointmentText.isEmpty) return;

    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final now = DateTime.now();

    try {
      final response = await supabase.from('appointments').insert({
        'title': appointmentText,
        'date': now.toIso8601String(),
        'user_id': user.id,
      }).select();

      final inserted = response.first;

      setState(() {
        medicalAppointments.insert(
          0,
          Appointment(
            id: inserted['id'].toString(),
            title: appointmentText,
            date: now,
          ),
        );
      });

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar la cita: $e')),
      );
    }
  }

  Future<void> _deleteAppointment(String appointmentId, int index) async {
    final supabase = Supabase.instance.client;
    try {
      await supabase.from('appointments').delete().eq('id', appointmentId);
      setState(() {
        medicalAppointments.removeAt(index);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar cita: $e')),
      );
    }
  }

void _showEditAppointmentDialog(Appointment appointment, int index) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ConsultaScreen(
        initialDoctor: appointment.title, // Asumimos que `title` es el nombre del médico o propósito
        initialDateTime: appointment.date,
      ),
    ),
  );

  if (result != null && result is Map<String, dynamic>) {
    final updatedTitle = result['purpose']; // o usa 'doctor' si prefieres
    final updatedDateTime = result['datetime'];

    final supabase = Supabase.instance.client;
    try {
      await supabase.from('appointments').update({
        'title': updatedTitle,
        'date': updatedDateTime.toIso8601String(),
      }).eq('id', appointment.id);

      setState(() {
        medicalAppointments[index] = Appointment(
          id: appointment.id,
          title: updatedTitle,
          date: updatedDateTime,
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al editar cita: $e')),
      );
    }
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
                itemBuilder: (context, index) {
                  final appointment = medicalAppointments[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.medical_services, color: Colors.white),
                      ),
                      title: Text(appointment.title),
                      subtitle: Text(
                        'Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(appointment.date)}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () =>
                                _showEditAppointmentDialog(appointment, index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                _deleteAppointment(appointment.id, index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: _navigateToConsultaScreen,
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


