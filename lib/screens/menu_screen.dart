import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:login/screens/BaseScreen.dart';
import 'package:login/screens/profilecosult_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class Appointment {
  final String id;
  final String title;
  final DateTime date;

  Appointment({required this.id, required this.title, required this.date});
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Appointment> medicalAppointments = [];
  final int _currentBottomNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  // ───────────────────────────────────────────────────────────────
  // Cargar citas
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
      medicalAppointments = response.map<Appointment>((data) {
        return Appointment(
          id: data['id'].toString(),
          title: data['title'],
          date: DateTime.parse(data['date']),
        );
      }).toList();
    });
  }

  // ───────────────────────────────────────────────────────────────
  // Crear nueva cita desde pantalla de consulta
  Future<void> _navigateToConsultaScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ConsultaScreen()),
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
        _showSnackBar('Error al guardar la cita: $e');
      }
    }
  }

  // ───────────────────────────────────────────────────────────────
  // Editar cita existente
  Future<void> _showEditAppointmentDialog(Appointment appointment, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ConsultaScreen(
          initialDoctor: appointment.title,
          initialDateTime: appointment.date,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      final updatedTitle = result['purpose'];
      final updatedDateTime = result['datetime'];

      try {
        await Supabase.instance.client.from('appointments').update({
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
        _showSnackBar('Error al editar cita: $e');
      }
    }
  }

  // ───────────────────────────────────────────────────────────────
  // Eliminar cita
  Future<void> _deleteAppointment(String id, int index) async {
    try {
      await Supabase.instance.client.from('appointments').delete().eq('id', id);
      setState(() => medicalAppointments.removeAt(index));
    } catch (e) {
      _showSnackBar('Error al eliminar cita: $e');
    }
  }

  // ───────────────────────────────────────────────────────────────
  // Utilidad para mostrar mensajes
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // ───────────────────────────────────────────────────────────────
  // UI - Estado vacío
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

  // ───────────────────────────────────────────────────────────────
  // UI - Cuerpo principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        scaffoldKey: _scaffoldKey,
        currentIndex: _currentBottomNavIndex,
        body: medicalAppointments.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: medicalAppointments.length,
                itemBuilder: (_, index) {
                  final appointment = medicalAppointments[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
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
                            onPressed: () => _showEditAppointmentDialog(appointment, index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteAppointment(appointment.id, index),
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
}
