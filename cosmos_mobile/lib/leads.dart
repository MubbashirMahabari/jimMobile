import 'package:flutter/material.dart';
import 'leads_appbar.dart';
import './component/leads_button_group.dart';
import 'package:flutter_adaptive_layout/flutter_adaptive_layout.dart';

class LeadsPage extends StatelessWidget {
  const LeadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        smallBuilder: (context, child) => const Padding(
          padding: EdgeInsets.all(0.0),
          child: ButtonGroup(),
        ),
        mediumBuilder: (context, child) => const Padding(
          padding: EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Leads Page - Medium Layout',
                  style: TextStyle(fontSize: 24),
                ),
                ButtonGroup(), // Add the ButtonGroup here
              ],
            ),
          ),
        ),
        largeBuilder: (context, child) => const Padding(
          padding: EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Leads Page - Large Layout',
                  style: TextStyle(fontSize: 24),
                ),
                ButtonGroup(), // Add the ButtonGroup here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
