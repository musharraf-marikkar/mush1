import 'package:flutter/material.dart';
import 'free_time_slot_page.dart';
import 'view_free_time_slots_page.dart';
import 'create_appointment_page.dart';
import 'view_appointments_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FreeTimeSlotPage()),
                );
              },
              child: const Text('Create Free Time Slots'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewFreeTimeSlotsPage(timeSlots: [])),
                );
              },
              child: const Text('View Free Time Slots'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateAppointmentPage(timeSlots: [],)),
                );
              },
              child: const Text('Create Appointment'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewAppointmentsPage()),
                );
              },
              child: const Text('View Appointments'),
            ),
          ],
        ),
      ),
    );
  }
}
