import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout/flutter_adaptive_layout.dart';
import 'dynamic_donut_chart.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAEDF3), // Background color
      child: AdaptiveLayout(
        smallBuilder: (context, child) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: DashboardContent(),
        ),
        mediumBuilder: (context, child) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: DashboardContent(),
        ),
        largeBuilder: (context, child) => const Padding(
          padding: EdgeInsets.all(16.0),
          child: DashboardContent(),
        ),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(2)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        height: 32,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF0095FF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("This Week"),
                            SizedBox(width: 8),
                            Image.asset('assets/icons/dropdown.png'),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 33,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF0095FF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMoneyCard(
                    'Money In',
                    '\$2,450',
                    '(Invoices marked paid)',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMoneyCard(
                    'Money Out',
                    '\$200',
                    '(Purchases/expenses)',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DynamicDonutChart(
              title: 'Leads : Contacted vs Uncontacted',
              data: {
                'Contacted': 18,
                'Not Contacted': 6,
              },
            ),
            const SizedBox(height: 12),
            DynamicDonutChart(
              title: 'Quotes: Accepted vs Not Accepted',
              data: {
                'Accepted': 18,
                'Not Accepted': 8,
                'Expired': 3,
              },
            ),
            const SizedBox(height: 12),
            DynamicDonutChart(
              title: 'Total Jobs : Booked Jobs vs Quote Visits',
              data: {
                'Booked Jobs': 9,
                'Quote Visits': 6,
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoneyCard(String title, String amount, String subtitle) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFF0095FF),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4D4D4D),
                  ),
                ),
                const SizedBox(width: 30),
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0055BB),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF4D4D4D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
