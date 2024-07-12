import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart'; // Import home.dart for navigation

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double age = 25; // Initial age value
  double weight = 50; // Initial weight value
  String selectedBloodGroup = '';
  DateTime? selectedDate; // Variable to store selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: const Text(
          'PROFILE',
          style: TextStyle(color: Colors.white), // Set color to white
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.red.shade900),
                hintText: 'Enter Name',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade900),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.red.shade900),
                hintText: 'Phone Number',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade900),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on, color: Colors.red.shade900),
                hintText: 'Location',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade900),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              onTap: () {
                // Show date picker on tap
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((value) {
                  setState(() {
                    selectedDate = value;
                  });
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today, color: Colors.red.shade900),
                hintText: selectedDate == null
                    ? 'Select Date of Birth'
                    : 'Date of Birth: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade900),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
            const Text(
              'Age',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Slider(
              value: age,
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Colors.red.shade900,
              inactiveColor: Colors.red.shade100,
              label: age.round().toString(),
              onChanged: (double value) {
                setState(() {
                  age = value;
                });
              },
            ),
            Text(
              'Selected Age: ${age.round()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
            const Text(
              'Weight',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Slider(
              value: weight,
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Colors.red.shade900,
              inactiveColor: Colors.red.shade100,
              label: weight.round().toString(),
              onChanged: (double value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            Text(
              'Selected Weight: ${weight.round()} kg',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
            const Text(
              'Blood Group',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BloodGroupButton(
                  text: 'A+',
                  isSelected: selectedBloodGroup == 'A+',
                  onTap: () => setState(() => selectedBloodGroup = 'A+'),
                ),
                BloodGroupButton(
                  text: 'O+',
                  isSelected: selectedBloodGroup == 'O+',
                  onTap: () => setState(() => selectedBloodGroup = 'O+'),
                ),
                BloodGroupButton(
                  text: 'B+',
                  isSelected: selectedBloodGroup == 'B+',
                  onTap: () => setState(() => selectedBloodGroup = 'B+'),
                ),
                BloodGroupButton(
                  text: 'AB+',
                  isSelected: selectedBloodGroup == 'AB+',
                  onTap: () => setState(() => selectedBloodGroup = 'AB+'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BloodGroupButton(
                  text: 'A-',
                  isSelected: selectedBloodGroup == 'A-',
                  onTap: () => setState(() => selectedBloodGroup = 'A-'),
                ),
                BloodGroupButton(
                  text: 'O-',
                  isSelected: selectedBloodGroup == 'O-',
                  onTap: () => setState(() => selectedBloodGroup = 'O-'),
                ),
                BloodGroupButton(
                  text: 'B-',
                  isSelected: selectedBloodGroup == 'B-',
                  onTap: () => setState(() => selectedBloodGroup = 'B-'),
                ),
                BloodGroupButton(
                  text: 'AB-',
                  isSelected: selectedBloodGroup == 'AB-',
                  onTap: () => setState(() => selectedBloodGroup = 'AB-'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900, // Red background color
                  minimumSize: Size(MediaQuery.of(context).size.width, 50), // Full width, height 50
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // No rounded corners
                    side: BorderSide(color: Colors.white, width: 1), // White outline
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class BloodGroupButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const BloodGroupButton({super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: isSelected ? 80 : 70,
        height: isSelected ? 80 : 70,
        decoration: BoxDecoration(
          color: isSelected ? Colors.red.shade900 : Colors.red.shade900,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [const BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 1)]
              : [],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
