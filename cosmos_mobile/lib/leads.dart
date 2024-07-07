import 'package:flutter/material.dart';
import './component/leads_button_group.dart';
import 'package:flutter_adaptive_layout/flutter_adaptive_layout.dart';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';

class LeadsPage extends StatefulWidget {
  const LeadsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeadsPageState createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> {
  final ValueNotifier<bool> _alarmStatus = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _initializeAlarmService();
  }

  void _initializeAlarmService() async {
    await Alarm.init();
    Alarm.ringStream.stream.listen((alarmSettings) {
      // Determine which alarm is ringing and show the corresponding dialog
      switch (alarmSettings.id) {
        case 1:
          _showCustomDialog(1, 1, "5 seconds");
          break;
        case 2:
          _showCustomDialog(2, 2, "40 seconds");
          break;
        case 3:
          _showCustomDialog(3, 3, "75 seconds");
          break;
        case 4:
          _showCustomDialog(4, 4, "110 seconds");
          break;
      }
    });
  }

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

  static Future<void> _setAlarm(int id, DateTime dateTime) async {
    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: dateTime,
      assetAudioPath:
          'assets/alarm_sound.mp3', // Make sure to place your alarm sound file in assets
      loopAudio: true,
      vibrate: false,
      notificationTitle: 'Alarm Notification',
      notificationBody: 'New Lead: Xianli Kun',
      enableNotificationOnKill: true, // For iOS background notifications
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }

  Future<void> _stopAlarm(int alarmId) async {
    await Alarm.stop(alarmId);
    _alarmStatus.value = false;
  }

  Future<void> _stopAllAlarms(int currentAlarmId) async {
    for (int id = currentAlarmId; id <= 4; id++) {
      await Alarm.stop(id);
    }
    _alarmStatus.value = false; // Ensure to set _alarmStatus to false
  }

  void _startAlarm() async {
    DateTime now = DateTime.now();
    await _setAlarm(1, now.add(const Duration(seconds: 5)));
    await _setAlarm(2, now.add(const Duration(seconds: 40)));
    await _setAlarm(3, now.add(const Duration(seconds: 75)));
    await _setAlarm(4, now.add(const Duration(seconds: 110)));
  }

  void _showCustomDialog(int alarmId, int alarmNumber, String alarmTime) {
    _alarmStatus.value = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ValueListenableBuilder<bool>(
              valueListenable: _alarmStatus,
              builder: (context, value, child) {
                if (!value) {
                  Navigator.of(context).pop();
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/icons/clock.png",
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          child: IconButton(
                            icon: Image.asset(
                              "assets/icons/close.png",
                            ),
                            onPressed: () async {
                              await _stopAlarm(alarmId);
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      child: Text(
                        "Alarm $alarmNumber",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                      child: Column(
                        children: [
                          Text(
                            "It's been $alarmTime since a lead was received\n",
                            style: const TextStyle(
                              fontSize: 20,
                              height: 1.3,
                              color: Color(0xff636363),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            "Call the lead?",
                            style: TextStyle(
                              fontSize: 20,
                              height: 1.3,
                              color: Color(0xff636363),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 12, 8, 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              onPressed: () {
                                // Add call functionality here
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff2D761B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/call.png",
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    "Call",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: TextButton(
                              onPressed: () async {
                                await _stopAllAlarms(alarmId);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff0055BB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/contact.png",
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    "Contact made",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leads = [
      {
        'id': 1,
        'name': 'Ayesha Khan',
        'service': 'Pool Fencing Installation',
        'location': '15 jayanagar Bangalore',
        'latitude': -37.840935,
        'longitude': 144.946457,
        'time': '10 Aug, 12:00 pm',
        'status': 'Uncontacted',
        'distance': '5 km',
        'timeLeft': '00:00:00',
      },
      {
        'id': 2,
        'name': 'Xianli Kun',
        'service': 'Noise Reduction Fencing',
        'location': '15 Hardware Ln, Melbourne VIC...',
        'latitude': -37.813628,
        'longitude': 144.963058,
        'time': '10 Aug, 01:30 pm',
        'status': 'Uncontacted',
        'distance': '10 km',
        'timeLeft': '01:30:00',
      },
      // Add more leads as needed
    ];

    return Scaffold(
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
                    return LeadCard(
                      lead: leads[index],
                      startAlarm: _startAlarm,
                      stopAlarm: _stopAlarm,
                      stopAllAlarms: _stopAllAlarms,
                    );
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
                      return LeadCard(
                        lead: leads[index],
                        startAlarm: _startAlarm,
                        stopAlarm: _stopAlarm,
                        stopAllAlarms: _stopAllAlarms,
                      );
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
                      return LeadCard(
                        lead: leads[index],
                        startAlarm: _startAlarm,
                        stopAlarm: _stopAlarm,
                        stopAllAlarms: _stopAllAlarms,
                      );
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

class LeadCard extends StatelessWidget {
  final Map<String, dynamic> lead;
  final Function startAlarm;
  final Function stopAlarm;
  final Function stopAllAlarms;

  const LeadCard({
    super.key,
    required this.lead,
    required this.startAlarm,
    required this.stopAlarm,
    required this.stopAllAlarms,
  });

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
    List<bool> alarms = getAlarmStatus(lead['timeLeft']);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFF74A6E0)),
      ),
      child: Container(
        color: const Color(0xFFeff4f8),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 15, top: 5, right: 10, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                lead['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0a4d94),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: const Color(0xFFaeb2bb)),
                                ),
                                child: Text(
                                  lead[
                                      'distance'], // Display the calculated distance
                                  style: const TextStyle(
                                      fontSize: 12, color: Color(0xFF0a4d94)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 0),
                        Text(
                          lead['service'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF777b7e),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                lead['location'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF777b7e),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              lead['time'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF55595c),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            // Define your action here
                          },
                          splashColor: Colors.grey
                              .withOpacity(0.3), // Splash color with opacity
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xFFaeb2bb)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              lead['status'],
                              style: const TextStyle(
                                color: Color(0xFFe71d19),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 0),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  // Define your action here
                                },
                                child: Container(
                                  width: 36, // Adjust the size as needed
                                  height: 32, // Adjust the size as needed
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2D761B),
                                    borderRadius: BorderRadius.circular(
                                        8), // Adjust the radius as needed
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/call_vector.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            InkWell(
                              onTap: () {
                                // Define your action here
                              },
                              child: Container(
                                width: 36, // Adjust the size as needed
                                height: 32, // Adjust the size as needed
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0055BB),
                                  borderRadius: BorderRadius.circular(
                                      8), // Adjust the radius as needed
                                ),
                                child: const Center(
                                  child: Text(
                                    "M1",
                                    style: TextStyle(
                                      color: Colors
                                          .white, // Set text color to white
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            InkWell(
                              onTap: () {
                                // Define your action here
                              },
                              child: Container(
                                width: 36, // Adjust the size as needed
                                height: 32, // Adjust the size as needed
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0055BB),
                                  borderRadius: BorderRadius.circular(
                                      8), // Adjust the radius as needed
                                ),
                                child: const Center(
                                  child: Text(
                                    "M2",
                                    style: TextStyle(
                                      color: Colors
                                          .white, // Set text color to white
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: () => startAlarm(),
                                child: Container(
                                  width: 94,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE51B1B),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Action Lead",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFBABABA))),
                    child: Column(
                      children: [
                        const Text(
                          'Time Left',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF606060),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.all(
                              20), // Add padding to the time left container
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                  value: 1.0,
                                  strokeWidth: 5.0,
                                  color: getTimeLeftColor(lead['timeLeft']),
                                ),
                              ),
                              Text(
                                lead['timeLeft'],
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF606060),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 1), // Add margin to the container
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFf3f1f2), // Grey background for alarms
                            borderRadius:
                                BorderRadius.circular(30), // Border radius 30
                          ),
                          padding: const EdgeInsets.all(
                              6), // Add padding to center the alarms
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                alarms[0]
                                    ? const Image(
                                        image: AssetImage(
                                            'assets/icons/al-30.png'),
                                        width: 18,
                                        height: 18,
                                      )
                                    : Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: getTimeLeftColor(
                                              lead['timeLeft']),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                const SizedBox(width: 4),
                                alarms[1]
                                    ? const Image(
                                        image: AssetImage(
                                            'assets/icons/al-60.png'),
                                        width: 18,
                                        height: 18,
                                      )
                                    : Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: getTimeLeftColor(
                                              lead['timeLeft']),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                const SizedBox(width: 4),
                                alarms[2]
                                    ? const Image(
                                        image: AssetImage(
                                            'assets/icons/al-90.png'),
                                        width: 18,
                                        height: 18,
                                      )
                                    : Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: getTimeLeftColor(
                                              lead['timeLeft']),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                const SizedBox(width: 4),
                                alarms[3]
                                    ? const Image(
                                        image: AssetImage(
                                            'assets/icons/al-120.png'),
                                        width: 18,
                                        height: 18,
                                      )
                                    : Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: getTimeLeftColor(
                                              lead['timeLeft']),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}
