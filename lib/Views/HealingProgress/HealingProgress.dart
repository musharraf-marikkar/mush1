import 'package:flutter/material.dart';
import 'package:pentacode/Views/HealingProgress/healinglevel.dart';
import 'package:pentacode/Views/HealingProgress/lineChart.dart';

class HealingProgress extends StatelessWidget {
  const HealingProgress({Key? key});

  Future<List<HealingLevels>> fetchHealingLevels() async {
    // Simulate fetching data from a database
    // Replace this section with your API call to fetch data from the database
    return [
      HealingLevels(x: DateTime(2023, 7, 1), y: 5.0),
      HealingLevels(x: DateTime(2023, 7, 2), y: 7.0),
      HealingLevels(x: DateTime(2023, 7, 3), y: 9.0),
      HealingLevels(x: DateTime(2023, 7, 4), y: 6.0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healing Progress',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healing Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
        child: Center(
          child: FutureBuilder<List<HealingLevels>>(
            future: HealingProgress().fetchHealingLevels(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No data available');
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LineChartWidget(snapshot.data!),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add your logic for handling the button press
                      },
                      child: const Text('Make Appointment'),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}