import 'package:flutter/material.dart';


class ConsultaScreen extends StatefulWidget {
  final String? initialDoctor;
  final String? initialPurpose;
  final DateTime? initialDateTime;

  const ConsultaScreen({
    Key? key,
    this.initialDoctor,
    this.initialPurpose,
    this.initialDateTime,
  }) : super(key: key);

  @override
  State<ConsultaScreen> createState() => _EditAppointmentScreenState();
}

class _EditAppointmentScreenState extends State<ConsultaScreen> {
  final _doctorController = TextEditingController();
  final _purposeController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _doctorController.text = widget.initialDoctor ?? '';
    _purposeController.text = widget.initialPurpose ?? '';
    if (widget.initialDateTime != null) {
      _selectedDate = widget.initialDateTime;
      _selectedTime = TimeOfDay.fromDateTime(widget.initialDateTime!);
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveAppointment() {
    if (_doctorController.text.isEmpty || _purposeController.text.isEmpty || _selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    final selectedDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    // Aquí podrías enviar los datos a donde necesites, o regresar a la pantalla anterior
    Navigator.pop(context, {
      'doctor': _doctorController.text,
      'purpose': _purposeController.text,
      'datetime': selectedDateTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _doctorController,
              decoration: InputDecoration(
                labelText: 'Nombre del médico',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _purposeController,
              decoration: InputDecoration(
                labelText: '¿Para qué es la cita?',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(_selectedDate == null
                  ? 'Selecciona la fecha'
                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
              onTap: _pickDate,
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text(_selectedTime == null
                  ? 'Selecciona la hora'
                  : _selectedTime!.format(context)),
              onTap: _pickTime,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveAppointment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Guardar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
