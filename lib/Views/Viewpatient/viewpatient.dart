import 'dart:convert';
import 'package:get/get.dart';
import 'package:pentacode/Views/SignInWithEmail/SignInWithEmail.dart';
import 'package:pentacode/configs/CommonFunctions.dart';
import 'package:pentacode/configs/Constants.dart';
import 'package:pentacode/configs/common_Exports.dart'; 
import 'package:flutter/material.dart';

class ViewPatient extends StatelessWidget {
  const ViewPatient({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Patients details',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Patient>> futurePatients;

  @override
  void initState() {
    super.initState();
    futurePatients = fetchPatients();
  }

  Future<List<Patient>> fetchPatients() async {
    // Uncomment the following lines and replace with your API URL to fetch real data
    /*
    final response = await http.get(Uri.parse('YOUR_API_URL_HERE'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((patient) => Patient.fromJson(patient)).toList();
    } else {
      throw Exception('Failed to load patients');
    }
    */

    // Sample data for demonstration purposes
    final response = '''
    [
      {
        "firstName": "John",
        "lastName": "Doe",
        "email": "john.doe@example.com",
        "mobileNumber": "+1234567890",
        "dob": "1990-01-01",
        "gender": "Male"
      },
      {
        "firstName": "Jane",
        "lastName": "Smith",
        "email": "jane.smith@example.com",
        "mobileNumber": "+0987654321",
        "dob": "1995-02-02",
        "gender": "Female"
      }
    ]
    ''';

    List jsonResponse = json.decode(response);
    return jsonResponse.map((patient) => Patient.fromJson(patient)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
          child: AppBar(
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "View Patient Details",
                style: TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 8.0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  "assets/images/profile.jpg",
                  height: 40,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Get.back();
                          await RemoveSharedPref(Constants.KEY_ACCESSTOKEN);
                          await RemoveSharedPref(Constants.KEY_MEMBER_DATA);
                          Get.off(SignInWithEmail());
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  );
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Patient>>(
        future: futurePatients,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No patients available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final patient = snapshot.data![index];
                return ListTile(
                  title: Text('${patient.firstName} ${patient.lastName}'),
                  subtitle: Text('${patient.email}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientDetailsScreen(patient: patient),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Patient {
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String dob;
  final String gender;

  Patient({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.dob,
    required this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      dob: json['dob'],
      gender: json['gender'],
    );
  }
}

class PatientDetailsScreen extends StatelessWidget {
  final Patient patient;

  const PatientDetailsScreen({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${patient.firstName} ${patient.lastName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${patient.email}', style: TextStyle(fontSize: 16)),
            Text('Mobile Number: ${patient.mobileNumber}', style: TextStyle(fontSize: 16)),
            Text('Date of Birth: ${patient.dob}', style: TextStyle(fontSize: 16)),
            Text('Gender: ${patient.gender}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            // Add your detailed patient information here
            // For example, Wound images and progress
            Text('Wound Image 1: (Placeholder for wound image)'),
            Text('Wound Mask 1: (Placeholder for wound mask)'),
            Text('Date: (Placeholder for date)'),
            Text('Wound Area: (Placeholder for wound area)'),
            Text('Wound Type: (Placeholder for wound type)'),
            Text('Progress of Healing: (Placeholder for healing progress percentage)'),
            SizedBox(height: 20),
            Text('Wound Image 2: (Placeholder for wound image)'),
            Text('Wound Mask 2: (Placeholder for wound mask)'),
            Text('Date: (Placeholder for date)'),
            Text('Wound Area: (Placeholder for wound area)'),
            Text('Wound Type: (Placeholder for wound type)'),
            Text('Progress of Healing: (Placeholder for healing progress percentage)'),
          ],
        ),
      ),
    );
  }
}