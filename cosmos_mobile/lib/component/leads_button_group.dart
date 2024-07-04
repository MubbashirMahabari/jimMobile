import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({super.key});

  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  String _selectedButton = 'Today'; // Initial selected button

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff0157C8), // Background color
      padding: const EdgeInsets.all(12.0), // Padding around the buttons
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildOutlinedButton('Today', true), // "Today" button with dropdown
            const SizedBox(width: 8), // Add space between buttons
            _buildOutlinedButton('Uncontacted'),
            const SizedBox(width: 8), // Add space between buttons
            _buildOutlinedButton('Contacted'),
            const SizedBox(width: 8), // Add space between buttons
            _buildOutlinedButton('Nearest'),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(String text, [bool hasDropdown = false]) {
    bool isSelected = _selectedButton == text;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedButton = text;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Colors.white : Colors.transparent,
        side: const BorderSide(color: Colors.white), // Border color
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'DMSans',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: isSelected
                  ? const Color(0xff0157C8)
                  : Colors.white, // Text color
            ),
          ),
          if (hasDropdown)
            Icon(
              Icons.arrow_drop_down,
              color: isSelected
                  ? const Color(0xff0157C8)
                  : Colors.white, // Dropdown icon color
            ),
        ],
      ),
    );
  }
}
