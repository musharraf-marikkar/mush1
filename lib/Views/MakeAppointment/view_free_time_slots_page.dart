import 'package:flutter/material.dart';
import 'time_slot.dart';

class ViewFreeTimeSlotsPage extends StatelessWidget {
  final List<TimeSlot> timeSlots;

  const ViewFreeTimeSlotsPage({Key? key, required this.timeSlots}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Free Time Slots'),
      ),
      body: ListView.builder(
        itemCount: timeSlots.length,
        itemBuilder: (context, index) {
          final timeSlot = timeSlots[index];
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
    );
  }
}


