import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  final List<Appointment> initialAppointments;

  const CalendarScreen({Key? key, required this.initialAppointments}) : super(key: key);

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
    
    // Inicializar con las citas existentes
    for (var appointment in widget.initialAppointments) {
      final day = DateTime(appointment.date.year, appointment.date.month, appointment.date.day);
      _appointmentsMap[day] = [..._appointmentsMap[day] ?? [], appointment];
    }
    
    _selectedAppointments = ValueNotifier(_getAppointmentsForDay(_selectedDay!));
  }

  List<Appointment> _getAppointmentsForDay(DateTime day) {
    return _appointmentsMap[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedAppointments.value = _getAppointmentsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de Citas'),
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
                return ListView.builder(
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

class Appointment {
  final String title;
  final DateTime date;

  Appointment({required this.title, required this.date});
}