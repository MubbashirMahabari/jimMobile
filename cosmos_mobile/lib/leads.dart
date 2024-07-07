import 'package:flutter/material.dart';
import './component/leads_button_group.dart';
import 'package:flutter_adaptive_layout/flutter_adaptive_layout.dart';
import 'component/lead_card.dart';
import "component/lead_alarm.dart";

class LeadsPage extends StatelessWidget {
  const LeadsPage({super.key});

  Color getTimeLeftColor(String timeLeft) {
    List<String> parts = timeLeft.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    if (hours == 0 && minutes <= 30) {
      return const Color(0xFFe71d19); // Red for 30 minutes or less
    } else if (hours == 0 && minutes <= 60) {
      return const Color(0xFFFFA500); // Orange for 1 hour or less
    } else if (hours == 0 && minutes <= 90) {
      return const Color(0xFFFFFF00); // Yellow for 1:30 or less
    } else {
      return const Color(0xFF35ba51); // Green for 2 hours or more
    }
  }

  List<bool> getAlarmStatus(String timeLeft) {
    List<String> parts = timeLeft.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    return [
      (hours == 0 && minutes <= 30),
      (hours == 0 && minutes <= 60),
      (hours == 0 && minutes <= 90),
      (hours == 0 && minutes <= 120),
    ];
  }

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
        'timeLeft': '00:00:00', // Placeholder for time left
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
      {
        'name': 'Aftab Abdullah',
        'service': 'Noise Reduction Fencing',
        'location': 'Port Melbourne, Victoria 3207...',
        'latitude': -37.841651,
        'longitude': 144.938574,
        'time': '10 Aug, 02:00 pm',
        'status': 'Uncontacted',
        'distance': '15 km', // Placeholder for calculated distance
        'timeLeft': '01:00:00', // Placeholder for time left
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
              const SizedBox(height: 10),
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
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
