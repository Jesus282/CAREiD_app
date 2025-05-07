import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

// Importa tu clase Appointment desde donde la tengas definida
import 'package:login/screens/menu_screen.dart'; // Asegúrate que este import apunte al archivo correcto

class TableEvents extends StatefulWidget {
  final List<Appointment> appointments;

  const TableEvents({Key? key, required this.appointments}) : super(key: key);

  @override
  State<TableEvents> createState() => _TableEventsState();
}

class _TableEventsState extends State<TableEvents> {
  late Map<DateTime, List<Appointment>> _events;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _events = _groupAppointments(widget.appointments);
  }

  Map<DateTime, List<Appointment>> _groupAppointments(List<Appointment> appointments) {
    final Map<DateTime, List<Appointment>> data = {};
    for (final appt in appointments) {
      final day = DateTime.utc(appt.date.year, appt.date.month, appt.date.day);
      if (data[day] == null) {
        data[day] = [appt];
      } else {
        data[day]!.add(appt);
      }
    }
    return data;
  }

  List<Appointment> _getAppointmentsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de Citas'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            eventLoader: _getAppointmentsForDay,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _buildAppointmentList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentList() {
    final appointments = _getAppointmentsForDay(_selectedDay);
    if (appointments.isEmpty) {
      return const Center(child: Text('No hay citas para este día'));
    }
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (_, index) {
        final appointment = appointments[index];
        return ListTile(
          leading: const Icon(Icons.calendar_today),
          title: Text(appointment.title),
          subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(appointment.date)),
        );
      },
    );
  }
}
