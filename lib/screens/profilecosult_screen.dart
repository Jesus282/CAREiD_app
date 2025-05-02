import 'package:flutter/material.dart';
import 'package:login/screens/BaseScreen.dart';
//
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
  State<ConsultaScreen> createState() => _ConsultaScreenState();
}

class _ConsultaScreenState extends State<ConsultaScreen> {
  final _doctorController = TextEditingController();
  final _purposeController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  int _currentIndex = 0;

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

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Aquí puedes hacer navegación si quieres
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
    if (_doctorController.text.isEmpty ||
        _purposeController.text.isEmpty ||
        _selectedDate == null ||
        _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
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

    Navigator.pop(context, {
      'doctor': _doctorController.text,
      'purpose': _purposeController.text,
      'datetime': selectedDateTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldKey: _scaffoldKey,
      currentIndex: _currentIndex,
      
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _doctorController,
              decoration: const InputDecoration(
                labelText: 'Nombre del médico',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _purposeController,
              decoration: const InputDecoration(
                labelText: '¿Para qué es la cita?',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(
                _selectedDate == null
                  ? 'Selecciona la fecha'
                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              ),
              onTap: _pickDate,
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(
                _selectedTime == null
                  ? 'Selecciona la hora'
                  : _selectedTime!.format(context),
              ),
              onTap: _pickTime,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveAppointment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
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
