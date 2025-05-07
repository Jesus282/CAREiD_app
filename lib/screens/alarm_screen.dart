import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/screens/BaseScreen.dart';
class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> alarmas = [];

  void _agregarAlarma() async {
    TimeOfDay? horaSeleccionada = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (horaSeleccionada != null) {
      TextEditingController notaController = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Agregar Nota de Alarma'),
            content: TextField(
              controller: notaController,
              decoration: const InputDecoration(hintText: 'Ej: Tomar medicina'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    alarmas.add({
                      'hora': horaSeleccionada,
                      'nota': notaController.text,
                      'activo': true,
                    });
                  });
                  Navigator.pop(context);
                },
                child: const Text('Guardar'),
              ),
            ],
          );
        },
      );
    }
  }

  void _activarDesactivarAlarma(int index) {
    setState(() {
      alarmas[index]['activo'] = !alarmas[index]['activo'];
    });
  }

  void _eliminarAlarma(int index) {
    setState(() {
      alarmas.removeAt(index);
    });
  }

  String _formatearHora(TimeOfDay hora) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, hora.hour, hora.minute);
    return DateFormat.jm().format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey,
      currentIndex: 0, // El índice que corresponda en tu BottomNavigationBar
    
      title: 'Mis Recordatorios', // <- Si BaseScreen acepta 'title'
      body: alarmas.isEmpty
          ? const Center(child: Text('No tienes alarmas configuradas'))
          : ListView.builder(
              itemCount: alarmas.length,
              itemBuilder: (context, index) {
                var alarma = alarmas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Icon(
                      alarma['activo'] ? Icons.alarm_on : Icons.alarm_off,
                      color: alarma['activo'] ? Colors.green : Colors.grey,
                      size: 40,
                    ),
                    title: Text(_formatearHora(alarma['hora'])),
                    subtitle: Text(alarma['nota']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            alarma['activo'] ? Icons.toggle_on : Icons.toggle_off,
                            color: alarma['activo'] ? Colors.green : Colors.grey,
                            size: 36,
                          ),
                          onPressed: () => _activarDesactivarAlarma(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _eliminarAlarma(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _agregarAlarma,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
