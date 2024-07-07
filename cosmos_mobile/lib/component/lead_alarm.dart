// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:alarm/alarm.dart';
// import 'package:alarm/model/alarm_settings.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// import './lead_card.dart';

// class LeadsAlarm extends StatefulWidget {
//   // final VoidCallback onStartAlarm;
//   // const LeadsAlarm({Key? key, required this.onStartAlarm}) : super(key: key);

//    const LeadsAlarm({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LeadsBodyState createState() => _LeadsBodyState();
// }

// class _LeadsBodyState extends State<LeadsAlarm> {
//   final ValueNotifier<bool> _alarmStatus = ValueNotifier<bool>(false);

//   @override
//   void initState() {
//     super.initState();
//     _initializeAlarmService();
//   }

//   void _initializeAlarmService() async {
//     await Alarm.init();
//     Alarm.ringStream.stream.listen((alarmSettings) {
//       // Determine which alarm is ringing and show the corresponding dialog
//       switch (alarmSettings.id) {
//         case 1:
//           _showCustomDialog(1, 1, "5 seconds");
//           break;
//         case 2:
//           _showCustomDialog(2, 2, "40 seconds");
//           break;
//         case 3:
//           _showCustomDialog(3, 3, "75 seconds");
//           break;
//         case 4:
//           _showCustomDialog(4, 4, "110 seconds");
//           break;
//       }
//     });
//   }

//   static Future<void> _setAlarm(int id, DateTime dateTime) async {
//     final alarmSettings = AlarmSettings(
//       id: id,
//       dateTime: dateTime,
//       assetAudioPath:
//           'assets/alarm_sound.mp3', // Make sure to place your alarm sound file in assets
//       loopAudio: true,
//       vibrate: false,
//       notificationTitle: 'Alarm Notification',
//       notificationBody: 'New Lead: Xianli Kun',
//       enableNotificationOnKill: true, // For iOS background notifications
//     );

//     await Alarm.set(alarmSettings: alarmSettings);
//   }

//   Future<void> _stopAlarm(int alarmId) async {
//     await Alarm.stop(alarmId);
//     _alarmStatus.value = false;
//   }

//   Future<void> _stopAllAlarms(int currentAlarmId) async {
//     for (int id = currentAlarmId; id <= 4; id++) {
//       await Alarm.stop(id);
//     }
//     _alarmStatus.value = false; // Ensure to set _alarmStatus to false
//   }

//   void _startAlarm() async {
//     DateTime now = DateTime.now();
//     await _setAlarm(1, now.add(const Duration(seconds: 5)));
//     await _setAlarm(2, now.add(const Duration(seconds: 40)));
//     await _setAlarm(3, now.add(const Duration(seconds: 75)));
//     await _setAlarm(4, now.add(const Duration(seconds: 110)));
//   }

//   void _showCustomDialog(int alarmId, int alarmNumber, String alarmTime) {
//     _alarmStatus.value = true; // Notify listeners that alarm is active

//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: ValueListenableBuilder<bool>(
//               valueListenable: _alarmStatus,
//               builder: (context, value, child) {
//                 if (!value) {
//                   Navigator.of(context)
//                       .pop(); // Close dialog when _alarmStatus is false
//                 }
//                 return Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Stack(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 100, // Adjust the height to match the design
//                           decoration: const BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20.0),
//                             ),
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               "assets/icons/clock.png", // Path of your icon
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           right: 2,
//                           child: IconButton(
//                             icon: Image.asset(
//                               "assets/icons/close.png", // Path of your icon
//                             ),
//                             onPressed: () async {
//                               await _stopAlarm(alarmId);
//                               _alarmStatus.value =
//                                   false; // Ensure to set _alarmStatus to false when alarm is stopped
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
//                       child: Text(
//                         "Alarm $alarmNumber",
//                         style: const TextStyle(
//                           color: Colors.red,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           height: 1.3,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
//                       child: Column(
//                         children: [
//                           Text(
//                             "It's been $alarmTime since a lead was received\n",
//                             style: const TextStyle(
//                               fontSize: 20,
//                               height: 1.3,
//                               color: Color(0xff636363),
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const Text(
//                             "Call Xianli Kun?",
//                             style: TextStyle(
//                               fontSize: 20,
//                               height: 1.3,
//                               color: Color(0xff636363),
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.fromLTRB(8, 12, 8, 16),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: TextButton(
//                               onPressed: () {
//                                 // Add call functionality here
//                               },
//                               style: TextButton.styleFrom(
//                                 backgroundColor: const Color(0xff2D761B),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     "assets/icons/call.png", // Path of your icon
//                                   ),
//                                   const SizedBox(
//                                     width: 2,
//                                   ),
//                                   const Text(
//                                     "Call",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             flex: 3,
//                             child: TextButton(
//                               onPressed: () async {
//                                 // Add contact made functionality here
//                                 await _stopAllAlarms(alarmId);
//                                 _alarmStatus.value =
//                                     false; // Ensure to set _alarmStatus to false when contact is made
//                               },
//                               style: TextButton.styleFrom(
//                                 backgroundColor: const Color(0xff0055BB),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     "assets/icons/contact.png", // Path of your icon
//                                   ),
//                                   const SizedBox(width: 2),
//                                   const Text(
//                                     "Contact made",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           _startAlarm();
//         },
//         child: const Text('Start Alarm'),
//       ),
//     );
//   }
// }
