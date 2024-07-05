import 'package:flutter/material.dart';

class LeadCard extends StatelessWidget {
  final Map<String, dynamic> lead; // Lead data

  const LeadCard({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Color(0xFFa9b8cb)),
      ),
      child: Container(
        color: const Color(0xFFeff4f8),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                        Row(children: [
                          Text(
                            lead['name'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0a4d94)),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xFFaeb2bb)),
                            ),
                            child: Text(
                              lead[
                                  'distance'], // Display the calculated distance
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xFF0a4d94)),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 8),
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
                        const SizedBox(height: 4),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFaeb2bb)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            lead['status'],
                            style: const TextStyle(
                                color: Color(0xFFe71d19),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 0),
                            GestureDetector(
                              onTap: () {
                                // Handle call button press
                              },
                              child: Image.asset(
                                'assets/icons/call.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                // Handle message 1 button press
                              },
                              child: Image.asset(
                                'assets/icons/m1.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                // Handle message 2 button press
                              },
                              child: Image.asset(
                                'assets/icons/m2.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                // Handle action button press
                              },
                              child: SizedBox(
                                height: 32, // Set the height to 32
                                child: Image.asset(
                                  'assets/icons/action-btn.png',
                                  fit: BoxFit.contain, // Scale the image to fit
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFaeb2bb))),
                    child: Column(
                      children: [
                        const Text(
                          'Time Left',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF606060),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(
                              10), // Add padding to the time left container
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
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/icons/al-30.png'),
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(width: 4),
                                Image(
                                  image:
                                      AssetImage('assets/icons/al-60.png'),
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(width: 4),
                                Image(
                                  image:
                                      AssetImage('assets/icons/al-90.png'),
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(width: 4),
                                Image(
                                  image:
                                      AssetImage('assets/icons/al-120.png'),
                                  width: 18,
                                  height: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
    if (hours == 0 && minutes <= 10) {
      return const Color(0xFFe71d19);
    } else if (hours == 0 && minutes <= 60) {
      return const Color(0xFFffdf5a); // Changed this line to return yellow
    } else {
      return const Color(0xFF35ba51);
    }
  }
}
