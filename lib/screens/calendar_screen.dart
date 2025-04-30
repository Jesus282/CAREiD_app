import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class TableEvents extends StatefulWidget {
  const TableEvents({super.key});

  @override
  State<TableEvents> createState() => _TableEventsState();
}

class _TableEventsState extends State<TableEvents> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  
  // 1. Definimos las variables de rango de fechas
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  
  // 2. Creamos un mapa de eventos vacío
  final Map<DateTime, List<Event>> _events = {};

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _selectedDay = _focusedDay;
    
    // 3. Inicializamos con eventos de ejemplo (opcional)
    _addExampleEvents();
    
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  // 4. Método para añadir eventos de ejemplo
  void _addExampleEvents() {
    final today = DateTime.now();
    
    _events[today] = [
      Event('Consulta con el cardiólogo'),
      Event('Revisión de análisis'),
    ];
    
    _events[today.add(const Duration(days: 1))] = [
      Event('Cita con el dentista'),
    ];
    
    _events[today.add(const Duration(days: 3))] = [
      Event('Control médico'),
      Event('Fisioterapia'),
    ];
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de Citas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddEventDialog,
            tooltip: 'Agregar cita',
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
            ),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              setState(() => _calendarFormat = format);
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, events, _) {
                return events.isEmpty
                    ? const Center(
                        child: Text(
                          'No hay citas para este día',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.event, color: Colors.blue),
                              title: Text(events[index].title),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _removeEvent(events[index], _selectedDay!),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Cambia esto dinámicamente si es necesario
        onTap: (index) {
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
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Ubicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  // 5. Diálogo para agregar nuevos eventos
  void _showAddEventDialog() async {
    final titleController = TextEditingController();
    DateTime selectedDate = _selectedDay ?? DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: _firstDay,
      lastDate: _lastDay,
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Nueva Cita'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Descripción de la cita',
              hintText: 'Ej: Consulta médica',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.trim().isNotEmpty) {
                  _addEvent(
                    selectedDate,
                    Event(titleController.text.trim()),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      );
    }
  }

  // 6. Método para agregar eventos
  void _addEvent(DateTime day, Event event) {
    setState(() {
      if (_events[day] == null) {
        _events[day] = [event];
      } else {
        _events[day]!.add(event);
      }
      _selectedEvents.value = _getEventsForDay(day);
    });
  }

  // 7. Método para eliminar eventos
  void _removeEvent(Event event, DateTime day) {
    setState(() {
      _events[day]?.remove(event);
      _selectedEvents.value = _getEventsForDay(day);
    });
  }
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}