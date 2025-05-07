import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final ValueNotifier<List<Appointment>> _selectedAppointments;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final LinkedHashMap<DateTime, List<Appointment>> _appointmentsMap = LinkedHashMap(
    equals: isSameDay,
    hashCode: (DateTime key) => key.day * 1000000 + key.month * 10000 + key.year,
  );

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _fetchAppointments();
  }

  // ───────────────────────────────────────────────────────────────
  // Consultar citas desde Supabase
  Future<void> _fetchAppointments() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) return;

    try {
      final response = await supabase
          .from('appointments') // Accede a la tabla 'appointments'
          .select('*') // Selecciona todas las columnas
          .eq('user_id', user.id) // Filtra por el 'user_id'
          .order('date', ascending: true) // Ordena por fecha
          .limit(100); // Agregar límite si es necesario

      if (response.error != null) {
        _showError('Error al cargar las citas: ${response.error!.message}');
        return;
      }

      final List<dynamic> data = response as List<dynamic>; // Obtener los datos de la respuesta

      // Mapeamos los datos a una lista de citas
      final List<Appointment> appointments = data.map((item) {
        return Appointment(
          title: item['title'],
          date: DateTime.parse(item['date']),
        );
      }).toList();

      setState(() {
        // Limpiar las citas del mapa
        _appointmentsMap.clear();

        // Agregar las citas al mapa por fecha
        for (var appointment in appointments) {
          final day = DateTime(appointment.date.year, appointment.date.month, appointment.date.day);
          _appointmentsMap[day] = [..._appointmentsMap[day] ?? [], appointment];
        }

        _selectedAppointments = ValueNotifier(_getAppointmentsForDay(_selectedDay!));
      });
    } catch (e) {
      _showError('Hubo un error al obtener las citas: $e');
    }
  }

  // ───────────────────────────────────────────────────────────────
  // Obtener las citas para un día específico
  List<Appointment> _getAppointmentsForDay(DateTime day) {
    return _appointmentsMap[day] ?? [];
  }

  // ───────────────────────────────────────────────────────────────
  // Manejar la selección de un día en el calendario
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedAppointments.value = _getAppointmentsForDay(selectedDay);
    }
  }

  // ───────────────────────────────────────────────────────────────
  // UI - Mostrar mensaje de error
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de Citas'),
        backgroundColor: Colors.blue[600],
      ),
      body: Column(
        children: [
          TableCalendar<Appointment>(
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            eventLoader: _getAppointmentsForDay,
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              setState(() => _calendarFormat = format);
            },
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ValueListenableBuilder<List<Appointment>>(
              valueListenable: _selectedAppointments,
              builder: (context, appointments, _) {
                return appointments.isEmpty
                    ? const Center(
                        child: Text(
                          'No hay citas para este día',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = appointments[index];
                          return ListTile(
                            leading: const Icon(Icons.medical_services, color: Colors.blue),
                            title: Text(appointment.title),
                            subtitle: Text(DateFormat('hh:mm a').format(appointment.date)),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension on PostgrestList {
  get error => null;
}

class Appointment {
  final String title;
  final DateTime date;

  Appointment({required this.title, required this.date});
}
