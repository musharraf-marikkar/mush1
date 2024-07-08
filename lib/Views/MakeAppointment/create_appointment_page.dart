import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'time_slot.dart';

class CreateAppointmentPage extends StatefulWidget {
  final List<TimeSlot> timeSlots;

  const CreateAppointmentPage({Key? key, required this.timeSlots}) : super(key: key);

  @override
  _CreateAppointmentPageState createState() => _CreateAppointmentPageState();
}

class _CreateAppointmentPageState extends State<CreateAppointmentPage> {
  late DateTime _selectedDay;
  List<TimeSlot> _filteredTimeSlots = [];

  TextEditingController _appointmentTitleController = TextEditingController();
  TimeSlot? _selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _filterTimeSlots();
  }

  @override
  void dispose() {
    _appointmentTitleController.dispose();
    super.dispose();
  }

  void _filterTimeSlots() {
    setState(() {
      _filteredTimeSlots = widget.timeSlots.where((timeSlot) {
        return timeSlot.startTime.year == _selectedDay.year &&
            timeSlot.startTime.month == _selectedDay.month &&
            timeSlot.startTime.day == _selectedDay.day;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Appointment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _filterTimeSlots();
              });
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected Date: ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<TimeSlot>(
                  value: _selectedTimeSlot,
                  onChanged: (value) {
                    setState(() {
                      _selectedTimeSlot = value;
                    });
                  },
                  items: _filteredTimeSlots.map((timeSlot) {
                    return DropdownMenuItem<TimeSlot>(
                      value: timeSlot,
                      child: Text(
                        'Time Slot: ${timeSlot.startTime.hour}:${timeSlot.startTime.minute.toString().padLeft(2, '0')} - ${timeSlot.endTime.hour}:${timeSlot.endTime.minute.toString().padLeft(2, '0')}',
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Select Time Slot',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _appointmentTitleController,
                  decoration: const InputDecoration(
                    labelText: 'Appointment Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _createAppointment();
                  },
                  child: const Text('Create Appointment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _createAppointment() {
    if (_selectedTimeSlot != null) {
      String appointmentTitle = _appointmentTitleController.text;
      DateTime startTime = _selectedTimeSlot!.startTime;
      DateTime endTime = _selectedTimeSlot!.endTime;

      // Example: Print appointment details
      print('Creating appointment on $_selectedDay with title: $appointmentTitle');
      print('Time Slot: ${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')} - ${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}');

      // Implement your logic to create the appointment
      // Reset form or navigate to another screen after creating appointment
    } else {
      _showErrorDialog('Please select a time slot.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

