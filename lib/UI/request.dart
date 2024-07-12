import 'package:flutter/material.dart';
import 'profile.dart';
import 'donation.dart';
import 'home.dart';


class BloodRequestForm extends StatefulWidget {
  const BloodRequestForm({super.key});

  @override
  _BloodRequestFormState createState() => _BloodRequestFormState();
}

class _BloodRequestFormState extends State<BloodRequestForm> {
  final _formKey = GlobalKey<FormState>();

  String _patientName = '';
  String _dateOfBirth = '';
  String _gender = '';
  String _patientID = '';
  String _bloodGroup = '';
  String _physicianName = '';
  String _department = '';
  String _physicianContact = '';
  String _hospitalName = '';
  String _hospitalAddress = '';
  String _hospitalContact = '';
  final List<String> _bloodComponents = [];
  int _quantity = 1;
  String _dateTimeNeeded = '';
  String _diagnosis = '';
  String _surgeryDetails = '';
  String _previousTransfusions = '';
  String _specialRequirements = '';
  bool _consent = false;
  String _comments = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), // Reduced height of the app bar
        child: AppBar(
          backgroundColor: Colors.red.shade900,
          centerTitle: true,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfile()), // Navigate to BloodRequestForm page
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.bloodtype),
              title: const Text('Blood Donation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Donate()), // Navigate to BloodRequestForm page
                ); // Navigate to donation.dart
              },
            ),

            ListTile(
              leading: const Icon(Icons.request_page), // Icon for Blood Request
              title: const Text('Blood Request'), // Text for Blood Request
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BloodRequestForm()), // Navigate to BloodRequestForm page
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.fact_check),
              title: const Text('Blood Facts'),
              onTap: () {
                // Navigate to Blood Facts page
              },
            ),
            ListTile(
              leading: const Icon(Icons.home), // Icon for Home Page
              title: const Text('Home Page'), // Text for Home Page
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Navigate to BloodRequestForm page
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white70,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.red.shade900,
                      child: const Center(
                        child: Text(
                          'Blood Request Form',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTextField('Full Name', Icons.person, (value) => _patientName = value),
                    const SizedBox(height: 16),
                    _buildDateTextField('Date of Birth', Icons.calendar_today, (value) => _dateOfBirth = value),
                    const SizedBox(height: 16),
                    _buildTextField('Gender', Icons.wc, (value) => _gender = value),
                    const SizedBox(height: 16),
                    _buildTextField('Patient ID', Icons.format_list_numbered, (value) => _patientID = value),
                    const SizedBox(height: 16),
                    _buildTextField('Blood Group', Icons.opacity, (value) => _bloodGroup = value),
                    const SizedBox(height: 16),
                    _buildTextField('Physician Name', Icons.person_outline, (value) => _physicianName = value),
                    const SizedBox(height: 16),
                    _buildTextField('Department', Icons.work, (value) => _department = value),
                    const SizedBox(height: 16),
                    _buildTextField('Contact Information', Icons.contact_phone, (value) => _physicianContact = value),
                    const SizedBox(height: 16),
                    _buildTextField('Hospital/Clinic Name', Icons.local_hospital, (value) => _hospitalName = value),
                    const SizedBox(height: 16),
                    _buildTextField('Address', Icons.location_on, (value) => _hospitalAddress = value),
                    const SizedBox(height: 16),
                    _buildTextField('Contact Information', Icons.phone, (value) => _hospitalContact = value),
                    const SizedBox(height: 16),
                    _buildCheckboxList('Type of Blood Component', [
                      'Whole Blood',
                      'RBCs',
                      'Platelets',
                      'Plasma',
                      'Cryoprecipitate'
                    ]),
                    const SizedBox(height: 16),
                    _buildTextField('Quantity', Icons.format_list_numbered, (value) => _quantity = int.tryParse(value) ?? 1),
                    const SizedBox(height: 16),
                    _buildCheckboxList('Urgency', [
                      'Emergency',
                      'Scheduled/Planned',
                      'Routine',
                    ]),
                    const SizedBox(height: 16),
                    _buildDateTextField('Date and Time Needed', Icons.calendar_today, (value) => _dateTimeNeeded = value),
                    const SizedBox(height: 16),
                    _buildTextField('Diagnosis', Icons.local_hospital, (value) => _diagnosis = value),
                    const SizedBox(height: 16),
                    _buildTextField('Surgery Details (if applicable)', Icons.local_hospital, (value) => _surgeryDetails = value),
                    const SizedBox(height: 16),
                    _buildCheckboxWithText('Previous Transfusions', 'If Yes, Details', (value) => _previousTransfusions = value),
                    const SizedBox(height: 16),
                    _buildCheckboxWithText('Special Requirements', 'If Yes, Details', (value) => _specialRequirements = value),
                    const SizedBox(height: 16),
                    _buildConsentCheckbox(),
                    const SizedBox(height: 16),
                    _buildTextField('Comments', Icons.comment, (value) => _comments = value),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildSubmitButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, ValueChanged<String> onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.red.shade900),
        prefixIcon: Icon(icon, color: Colors.red.shade900),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
        ),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $label';
        }
        return null;
      },
    );
  }

  Widget _buildDateTextField(String label, IconData icon, ValueChanged<String> onChanged) {
    final TextEditingController controller = TextEditingController();
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.red.shade900),
        prefixIcon: Icon(icon, color: Colors.red.shade900),
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
                onChanged(controller.text);
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildCheckboxList(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red.shade900,
          ),
        ),
        ...options.map((option) => CheckboxListTile(
          title: Text(option, style: TextStyle(color: Colors.red.shade900)),
          value: _bloodComponents.contains(option),
          onChanged: (checked) {
            setState(() {
              if (checked!) {
                _bloodComponents.add(option);
              } else {
                _bloodComponents.remove(option);
              }
            });
          },
        )),
      ],
    );
  }

  Widget _buildCheckboxWithText(String title, String textFieldLabel, ValueChanged<String> onChanged) {
    final TextEditingController controller = TextEditingController();
    bool isChecked = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (checked) {
                setState(() {
                  isChecked = checked ?? false;
                  if (!isChecked) {
                    controller.clear();
                  }
                });
              },
            ),
          ],
        ),
        if (isChecked)
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: textFieldLabel,
              labelStyle: TextStyle(color: Colors.red.shade900),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade900),
              ),
            ),
            onChanged: onChanged,
          ),
      ],
    );
  }

  Widget _buildConsentCheckbox() {
    return CheckboxListTile(
      title: Text(
        'I hereby give my consent for the transfusion of blood products as prescribed',
        style: TextStyle(color: Colors.red.shade900),
      ),
      value: _consent,
      onChanged: (checked) {
        setState(() {
          _consent = checked ?? false;
        });
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Process the form submission
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade900, // Background color
        foregroundColor: Colors.white, // Text color
        padding: EdgeInsets.zero, // Remove padding
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Make the button rectangular
        ),
      ),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        child: const Text('SUBMIT'),
      ),
    );
  }
}

