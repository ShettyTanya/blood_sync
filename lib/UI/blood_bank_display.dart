import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BloodBankDisplay extends StatelessWidget {
  final String bloodGroup;
  final int quantity;
  final List<Map<String, dynamic>> availableBloodBanks;

  const BloodBankDisplay({
    Key? key,
    required this.bloodGroup,
    required this.quantity,
    required this.availableBloodBanks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        iconTheme: IconThemeData(color: Colors.white), // Set the back button color to white
      ),
      body: Column(
        children: [
          const SizedBox(height: 16), // Add space between the AppBar and the Container
          Container(
            width: double.infinity,
            color: Colors.red.shade900,
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                'Available Blood Banks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: availableBloodBanks.length,
                itemBuilder: (context, index) {
                  final bloodBank = availableBloodBanks[index];
                  final bloodBankName = bloodBank['name'];
                  final bloodBankData = bloodBank['data'];
                  final bloodAvailable = bloodBankData[bloodGroup];
                  final bloodBankPhoneNumber = bloodBankData['phone_number'];

                  return Card(
                    child: ListTile(
                      title: Text(
                        bloodBankName,
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Available units of $bloodGroup: $bloodAvailable'),
                          Text('Contact: $bloodBankPhoneNumber'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
