import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_profile.dart'; // Import the EditPage

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String _name = '';
  String _phoneNumber = '';
  String _location = '';
  String _dob = '';
  double _age = 0;
  double _weight = 0;
  String _bloodGroup = '';

  final String _avatarUrl = 'https://via.placeholder.com/150';

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('profile').doc(user.uid).get();
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        setState(() {
          _name = data['name'] ?? '';
          _phoneNumber = data['phone_number'] ?? '';
          _location = data['location'] ?? '';
          _dob = data['date_of_birth'] ?? '';
          _age = (data['age'] ?? 0).toDouble();
          _weight = (data['weight'] ?? 0).toDouble();
          _bloodGroup = data['blood_group'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'My Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              // Navigate to the EditPage and wait for result
              final Map<String, dynamic>? result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(
                    name: _name,
                    phoneNumber: _phoneNumber,
                    location: _location,
                    dob: _dob,
                    age: _age,
                    weight: _weight,
                    bloodGroup: _bloodGroup,
                  ),
                ),
              );

              // Update state with edited data if result is not null
              if (result != null) {
                setState(() {
                  _name = result['name'];
                  _phoneNumber = result['phoneNumber'];
                  _location = result['location'];
                  _dob = result['dob'];
                  _age = result['age'];
                  _weight = result['weight'];
                  _bloodGroup = result['bloodGroup'];
                });
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/intro.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_avatarUrl),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      _name.isNotEmpty ? _name : 'Loading...',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.phone, _phoneNumber.isNotEmpty ? _phoneNumber : 'Loading...'),
                      const SizedBox(height: 16),
                      _buildInfoRow(Icons.location_on, _location.isNotEmpty ? _location : 'Loading...'),
                      const SizedBox(height: 16),
                      _buildInfoRow(Icons.calendar_today, _dob.isNotEmpty ? _dob : 'Loading...'),
                      const SizedBox(height: 16),
                      _buildInfoRow(Icons.cake, 'Age: ${_age > 0 ? _age.toString() : 'Loading...'}'),
                      const SizedBox(height: 16),
                      _buildInfoRow(Icons.monitor_weight, 'Weight: ${_weight > 0 ? _weight.toString() : 'Loading...'} kg'),
                      const SizedBox(height: 16),
                      _buildInfoRow(Icons.bloodtype, 'Blood Group: ${_bloodGroup.isNotEmpty ? _bloodGroup : 'Loading...'}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
