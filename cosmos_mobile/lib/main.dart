import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout/flutter_adaptive_layout.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion charts package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dashboard',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0157C8),
        title: Padding(
          padding:
              const EdgeInsets.only(bottom: 26, top: 26), // Add padding here
          child: Container(
            padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/dashboard_icon.png', // Replace with your dashboard icon path
                      width: 38, // Adjust size as needed
                      height: 38,
                    ),
                    const SizedBox(
                        width: 10), // Adjust spacing between icon and text
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white, // Set text color to white
                        fontSize: 20, // Set font size to 24 pixels
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/icons/search_icon.png', // Replace with your search icon path
                      width: 28, // Adjust size as needed
                      height: 28,
                    ),
                  ],
                ),
                Image.asset(
                  'assets/icons/add.png',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFEAEDF3),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0157C8),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(1),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/leads.png',
              ),
              label: 'Leads'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/schedule.png',
              ),
              label: 'Schedule'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/jobs.png',
              ),
              label: 'Jobs'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/menu.png',
              ),
              label: 'Menu'),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

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
                            horizontal: 8, vertical: 0),
                        height: 32,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xFF0095FF), width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Add this line
                          children: [
                            const Text("This Week"),
                            const SizedBox(width: 8),
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
                                color: const Color(0xFF0095FF), width: 1),
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
                          )),
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
          color: Color(0xFF0095FF), // Border color
          width: 1.0,
        ),
        borderRadius:
            BorderRadius.circular(15.0), // Adjust border radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, color: Color(0xFF4D4D4D))),
                const SizedBox(width: 30),
                Checkbox(
                  value: false, // Set the initial value of the checkbox
                  onChanged: (value) {}, // Handle the checkbox change event
                ),
              ],
            ),
            Text(amount,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0055BB))),
            const SizedBox(height: 8),
            Text(subtitle,
                style: const TextStyle(fontSize: 10, color: Color(0xFF4D4D4D))),
          ],
        ),
      ),
    );
  }
}

class DynamicDonutChart extends StatelessWidget {
  final String title;
  final Map<String, int> data;

  const DynamicDonutChart({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    int total = data.values.fold(0, (sum, value) => sum + value);

    return Container(
      padding: const EdgeInsets.fromLTRB(9, 0, 9, 10),
      decoration: BoxDecoration(
         color: Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(15),
      ),
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
              height: 1.3,
              fontWeight: FontWeight.w400,
            ),
          ),
            Checkbox(
                  value: false, // Set the initial value of the checkbox
                  onChanged: (value) {}, // Handle the checkbox change event
                ),
          ],),
          
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 102,
                height: 102,
                child: SfCircularChart(
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$total',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.3,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            _getCardTitle(title),
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.3,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  series: <CircularSeries>[
                    DoughnutSeries<_ChartData, String>(
                      innerRadius: '80%',
                      radius: '100%',
                      dataSource: _getChartData(),
                      pointColorMapper: (_ChartData data, _) => data.color,
                      xValueMapper: (_ChartData data, _) => data.key,
                      yValueMapper: (_ChartData data, _) => data.value,
                      dataLabelMapper: (_ChartData data, _) => data.key,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: false),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 14,
                          color: _getColor(entry.key),
                        ),
                        const SizedBox(width: 4),
                        Text(entry.key),
                        const SizedBox(width: 4),
                        Text(
                          '${entry.value}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getCardTitle(String title) {
    switch (title) {
      case 'Leads : Contacted vs Uncontacted':
        return 'Leads';
      case 'Quotes: Accepted vs Not Accepted':
        return 'Quotes';
      case 'Total Jobs : Booked Jobs vs Quote Visits':
        return 'Jobs';
      default:
        return '';
    }
  }

  List<_ChartData> _getChartData() {
    return data.entries.map((entry) {
      return _ChartData(entry.key, entry.value, _getColor(entry.key));
    }).toList();
  }

  Color _getColor(String key) {
    switch (key) {
      case 'Accepted':
        return Colors.blue;
      case 'Not Accepted':
        return Colors.orange;
      case 'Expired':
        return Colors.red;
      case 'Contacted':
        return Colors.blue;
      case 'Not Contacted':
        return Colors.red;
      case 'Booked Jobs':
        return Colors.blue;
      case 'Quote Visits':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

class _ChartData {
  final String key;
  final int value;
  final Color color;

  _ChartData(this.key, this.value, this.color);
}
