import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String? selectedBloodGroup;
  String? selectedGender;
  DateTime? selectedDate;
  DateTime? lastDonationDate;
  String? selectedBloodBank;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _lastDonationDateController = TextEditingController();

  // Checkboxes
  Map<String, bool> recentHistory = {
    'Surgery': false,
    'Tattoo': false,
    'Blood Transfusion': false,
  };

  Map<String, bool> ailments = {
    'Diabetes': false,
    'Hypertension': false,
    'Heart Disease': false,
    'Asthma': false,
    'Cancer': false,
    'Epilepsy': false,
    'HIV/AIDS': false,
    'Hepatitis': false,
  };

  List<String> bloodBanks = [
    'Red Cross Blood Bank',
    'City Hospital Blood Bank',
    'Community Blood Center',
    'Unity Blood Services',
    'Hope Blood Bank',
    'Angel Blood Bank',
    'Lifeblood Center',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), // Reduced height of the app bar
        child: AppBar(
          backgroundColor: Colors.red.shade900,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Open side menu
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red.shade900,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title:const  Text('Home Page'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to home page or perform desired action
              },
            ),
            ListTile(
              title: const Text('Blood Need'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to blood need page or perform desired action
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white70, // Slightly lighter red background
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.red.shade900,
                      child: const Center(
                        child: Text(
                          'Donation Form',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTextFieldWithIcon('Name', Icons.person),
                    const SizedBox(height: 16),
                    _buildTextFieldWithIcon('Age', Icons.cake),
                    const SizedBox(height: 16),
                    _buildTextFieldWithIcon('Phone no', Icons.phone),
                    const SizedBox(height: 16),
                    _buildTextFieldWithIcon('Location', Icons.location_on),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedBloodGroup,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBloodGroup = newValue;
                        });
                      },
                      items: bloodGroups.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Blood Group',
                        labelStyle: TextStyle(color: Colors.red.shade900),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 17),
                    Column(
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontSize: 16,
                          ),
                        ),
                        Column(
                          children: [
                            RadioListTile<String>(
                              title:const  Text('Male', style: TextStyle(fontSize: 14)),
                              value: 'Male',
                              groupValue: selectedGender,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: const Text('Female', style: TextStyle(fontSize: 14)),
                              value: 'Female',
                              groupValue: selectedGender,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title:const  Text('Other', style: TextStyle(fontSize: 14)),
                              value: 'Other',
                              groupValue: selectedGender,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildDateTextField('Date of Birth', _dateController),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextFieldWithIcon('Weight', Icons.line_weight),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFieldWithIcon('BP', Icons.favorite),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextFieldWithIcon('Pulse', Icons.monitor_heart),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFieldWithIcon('Hemoglobin', Icons.bloodtype),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildDateTextField('Last Donation Date', _lastDonationDateController),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedBloodBank,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBloodBank = newValue;
                        });
                      },
                      items: bloodBanks.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Select Blood Bank',
                        labelStyle: TextStyle(color: Colors.red.shade900),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildCheckboxes(recentHistory, 'In the last six months, have you had?'),
                    const SizedBox(height: 16),
                    _buildCheckboxes(ailments, 'Do you suffer from any ailments?'),
                    const SizedBox(height: 16),
                    const Text(
                      '*Do not consume alcohol or take any medications 24 hours prior to blood donation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 80), // Add padding to make space for the button
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 17), // Adjust padding to make the button thinner
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Make the button rectangular
                  ),
                ),
                child: const Text('SUBMIT'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithIcon(String label, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.red.shade900),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
        ),
        prefixIcon: Icon(icon, color: Colors.red.shade900),
      ),
    );
  }

  Widget _buildDateTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.red.shade900),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today, color: Colors.red.shade900),
          onPressed: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              setState(() {
                controller.text = "${pickedDate.toLocal()}".split(' ')[0];
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildCheckboxes(Map<String, bool> options, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.red.shade900,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...options.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: options[key],
            activeColor: Colors.red.shade900,
            onChanged: (bool? value) {
              setState(() {
                options[key] = value!;
              });
            },
          );
        }),
      ],
    );
  }
}
