import 'package:flutter/material.dart';
import 'dart:io'; // Import the dart:io library for File

class EditPage extends StatefulWidget {
  final String name;
  final int numberOfDonations;
  final String phoneNumber;
  final String email;
  final String dob;
  final String address;
  final String avatarUrl;

  const EditPage({super.key,
    required this.name,
    required this.numberOfDonations,
    required this.phoneNumber,
    required this.email,
    required this.dob,
    required this.address,
    required this.avatarUrl,
  });

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _donationsController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  File? _avatarFile; // Declare _avatarFile as nullable File

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _donationsController.text = widget.numberOfDonations.toString();
    _phoneController.text = widget.phoneNumber;
    _emailController.text = widget.email;
    _dobController.text = widget.dob;
    _addressController.text = widget.address;
    // Set _avatarFile to null initially to show default profile image
    _avatarFile = null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _donationsController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Pass edited data back to MyProfile page
              Navigator.pop(context, {
                'name': _nameController.text,
                'numberOfDonations': int.tryParse(_donationsController.text) ?? 0,
                'phoneNumber': _phoneController.text,
                'email': _emailController.text,
                'dob': _dobController.text,
                'address': _addressController.text,
                'avatarFile': _avatarFile,
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle picking image here
                  // Placeholder for future implementation
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _avatarFile != null
                      ? FileImage(_avatarFile!)
                      : NetworkImage(widget.avatarUrl) as ImageProvider,
                  // Use default image if _avatarFile is null
                  // Replace NetworkImage with AssetImage or any other default image asset
                  // if _avatarFile is null
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _donationsController,
              decoration: const InputDecoration(labelText: 'Number of Donations'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: _dobController,
              decoration: const InputDecoration(labelText: 'Date of Birth'),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
          ],
        ),
      ),
    );
  }
}
