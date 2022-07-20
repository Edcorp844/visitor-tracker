import 'package:flutter/material.dart';

Widget actionButton(
    IconData icon, String actionTitle, Color iconColor, function) {
  return Expanded(
      child: TextButton.icon(
          onPressed: function,
          icon: Icon(
            icon,
            color: iconColor,
          ),
          label: Text(
            actionTitle,
            style: const TextStyle(color: Colors.white),
          )));
}
