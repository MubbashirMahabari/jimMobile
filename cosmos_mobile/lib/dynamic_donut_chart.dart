import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
            ],
          ),
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
