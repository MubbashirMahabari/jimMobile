import 'package:flutter/material.dart';
import './component/leads_button_group.dart';
import 'package:flutter_adaptive_layout/flutter_adaptive_layout.dart';
import 'component/lead_card.dart';

class LeadsPage extends StatelessWidget {
  const LeadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leads = [
      {
        'name': 'Ayesha Khan',
        'service': 'Pool Fencing Installation',
        'location': '15 jayanagar Bangalore',
        'latitude': -37.840935,
        'longitude': 144.946457,
        'time': '10 Aug, 12:00 pm',
        'status': 'Uncontacted',
        'distance': '5 km', // Placeholder for calculated distance
        'timeLeft': '00:10:00', // Placeholder for time left
      },
      {
        'name': 'Xianli Kun',
        'service': 'Noise Reduction Fencing',
        'location': '15 Hardware Ln, Melbourne VIC...',
        'latitude': -37.813628,
        'longitude': 144.963058,
        'time': '10 Aug, 01:30 pm',
        'status': 'Uncontacted',
        'distance': '10 km', // Placeholder for calculated distance
        'timeLeft': '01:30:00', // Placeholder for time left
      },
      {
        'name': 'Charlotte Jones',
        'service': 'Noise Reduction Fencing',
        'location': 'Port Melbourne, Victoria 3207...',
        'latitude': -37.841651,
        'longitude': 144.938574,
        'time': '10 Aug, 02:00 pm',
        'status': 'Uncontacted',
        'distance': '15 km', // Placeholder for calculated distance
        'timeLeft': '02:00:00', // Placeholder for time left
      },
    ];

    return Scaffold(
      // Assuming you have an AppBar for LeadsPage
      body: AdaptiveLayout(
        smallBuilder: (context, child) => Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              const ButtonGroup(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: leads.length,
                  itemBuilder: (context, index) {
                    return LeadCard(lead: leads[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        mediumBuilder: (context, child) => Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Leads Page - Medium Layout',
                  style: TextStyle(fontSize: 24),
                ),
                const ButtonGroup(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: leads.length,
                    itemBuilder: (context, index) {
                      return LeadCard(lead: leads[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        largeBuilder: (context, child) => Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Leads Page - Large Layout',
                  style: TextStyle(fontSize: 24),
                ),
                const ButtonGroup(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: leads.length,
                    itemBuilder: (context, index) {
                      return LeadCard(lead: leads[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
