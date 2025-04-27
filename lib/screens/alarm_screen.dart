import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<Map<String, dynamic>> alarmas = [];

  void _agregarAlarma() async {
    TimeOfDay? horaSeleccionada = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (horaSeleccionada != null) {
      TextEditingController _notaController = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Agregar Nota de Alarma'),
            content: TextField(
              controller: _notaController,
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
                      'nota': _notaController.text,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Recordatorios'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
