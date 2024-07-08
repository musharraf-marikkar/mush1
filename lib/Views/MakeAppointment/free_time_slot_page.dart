import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'time_slot.dart';
import 'view_free_time_slots_page.dart';

class FreeTimeSlotPage extends StatefulWidget {
  const FreeTimeSlotPage({Key? key}) : super(key: key);

  @override
  _FreeTimeSlotPageState createState() => _FreeTimeSlotPageState();
}

class _FreeTimeSlotPageState extends State<FreeTimeSlotPage> {
  late DateTime _selectedDay;
  List<TimeSlot> _timeSlots = [];

  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  @override
  void dispose() {
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Free Time Slots'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, _) {
              setState(() {
                _selectedDay = selectedDay;
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
                TextField(
                  controller: _startTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Start Time (HH:mm)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _endTimeController,
                  decoration: const InputDecoration(
                    labelText: 'End Time (HH:mm)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _addTimeSlot();
                  },
                  child: const Text('Add Free Time Slot'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _timeSlots.length,
              itemBuilder: (context, index) {
                final timeSlot = _timeSlots[index];
                return ListTile(
                  title: Text(
                    'Time Slot ${index + 1}: ${timeSlot.startTime.hour}:${timeSlot.startTime.minute.toString().padLeft(2, '0')} - ${timeSlot.endTime.hour}:${timeSlot.endTime.minute.toString().padLeft(2, '0')}',
                  ),
                  subtitle: Text(
                    'Date: ${timeSlot.startTime.day}/${timeSlot.startTime.month}/${timeSlot.startTime.year}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewFreeTimeSlotsPage(timeSlots: _timeSlots),
            ),
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }

  void _addTimeSlot() {
    DateTime? startTime = _parseTime(_startTimeController.text);
    DateTime? endTime = _parseTime(_endTimeController.text);
    if (startTime != null && endTime != null) {
      setState(() {
        _timeSlots.add(TimeSlot(startTime: startTime, endTime: endTime));
      });
      print('Added time slot: $startTime - $endTime');
      _startTimeController.clear();
      _endTimeController.clear();
    } else {
      _showErrorDialog();
    }
  }

  DateTime? _parseTime(String timeStr) {
    try {
      List<String> parts = timeStr.split(':');
      if (parts.length == 2) {
        int hour = int.parse(parts[0]);
        int minute = int.parse(parts[1]);
        return DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day, hour, minute);
      }
    } catch (e) {
      print('Error parsing time: $e');
    }
    return null;
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Time Format'),
          content: const Text('Please enter time in HH:mm format.'),
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


