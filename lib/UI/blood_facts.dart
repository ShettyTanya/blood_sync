import 'package:flutter/material.dart';
import 'home.dart';
import 'donation.dart';
import 'request.dart';

class BloodFactsPage extends StatelessWidget {
  const BloodFactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Facts', style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontFamily: 'roboto',
          fontWeight: FontWeight.w700,
        )),
        backgroundColor: Colors.red.shade900,
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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bloodtype),
              title: const Text('Donate Blood'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Donate()), // Navigate to Donate page
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.request_page),
              title: const Text('Request Blood'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BloodRequestForm()), // Navigate to BloodRequestForm page
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              factWidget('assets/img.png', 'Your blood makes up about 8% of your body weight.', true),
              factWidget('assets/img_5.png', 'The rarest blood type in the world is Rh-null, also known as "golden blood."', false),
              factWidget('assets/img_2.png', 'The human body contains about 5 liters (8 pints) of blood.', true),
              factWidget('assets/img_3.png', 'A single donation can save up to three lives.', false),
              factWidget('assets/img_4.png', 'People with O-negative blood are universal donors.', true),
              factWidget('assets/img_1.png', 'Blood is actually made up of four main components: red blood cells, white blood cells, plasma, and platelets.', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget factWidget(String imagePath, String fact, bool isImageLeft) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // Light pink background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          if (isImageLeft) ...[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3), // Red border
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(imagePath, width: 150, height: 150),
            ),
            const SizedBox(width: 15),
          ],
          Expanded(
            child: Text(
              fact,
              style: const TextStyle(fontSize: 17),
              textAlign: TextAlign.justify,
            ),
          ),
          if (!isImageLeft) ...[
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3), // Red border
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(imagePath, width: 150, height: 150),
            ),
          ],
        ],
      ),
    );
  }
}
