import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "./lead_alarm.dart";

class LeadCard extends StatelessWidget {
  final Map<String, dynamic> lead; // Lead data

  // final VoidCallback onStartAlarm;
  // const LeadCard({Key? key, required this.lead, required this.onStartAlarm})
  //     : super(key: key);

  const LeadCard({super.key, required this.lead});

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
                              cursor: SystemMouseCursors
                                  .click, // Changes cursor to pointer on hover
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LeadsAlarm(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 94, // Adjust the size as needed
                                  height: 32, // Adjust the size as needed
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE51B1B),
                                    borderRadius: BorderRadius.circular(
                                        8), // Adjust the radius as needed
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Action Lead",
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Set text color to white
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
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
                                    ? Image(
                                        image: const AssetImage(
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
                                    ? Image(
                                        image: const AssetImage(
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
                                    ? Image(
                                        image: const AssetImage(
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
                                    ? Image(
                                        image: const AssetImage(
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
      return const Color(0xFFe71d19); // Red
    } else if (hours == 1 && minutes == 30) {
      return Color.fromARGB(255, 244, 140, 28); //orange
    } else if (hours == 1 && minutes == 00) {
      return const Color(0xFFFFDE59); // Yellow
    } else {
      return const Color(0xFF35ba51); // Green
    }
  }

  List<bool> getAlarmStatus(String timeLeft) {
    List<String> parts = timeLeft.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    if (hours >= 2 && minutes == 0) {
      return [false, false, false, false];
    } else if (hours == 1 && minutes == 30) {
      return [true, false, false, false];
    } else if (hours == 1 && minutes == 0) {
      return [true, true, false, false];
    } else if (hours == 0 && minutes == 30) {
      return [true, true, true, false];
    } else if (hours == 0 && minutes == 0) {
      return [true, true, true, true];
    } else {
      return [false, false, false, false];
    }
  }
}
