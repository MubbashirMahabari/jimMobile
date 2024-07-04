import 'package:flutter/material.dart';

class LeadsAppBar extends StatelessWidget {
  const LeadsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icons/lead_icon.png", // Path of your icon
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Leads',
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      height: 26,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  "assets/icons/search_icon.png", // Path of your icon
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  "assets/icons/cloud.png", // Path of your icon
                ),
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  "assets/icons/add.png", // Path of your icon
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
