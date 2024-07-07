import 'package:flutter/material.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    backgroundColor: const Color(0xff0157C8),
    title: Padding(
      padding: const EdgeInsets.only(bottom: 36, top: 36),
      child: Container(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/dashboard_icon.png',
                  width: 38,
                  height: 38,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      height: 26,
                      color: Colors.white),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/icons/search_icon.png',
                  width: 18,
                  height: 18,
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
  );
}
