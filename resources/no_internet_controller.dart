import 'package:flutter/material.dart';

Widget noInternet() {
  return Scaffold(
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.wifi_off_outlined,
          color: Colors.grey,
          size: 100.0,
        ),
        Text(
          "No internet",
          style: TextStyle(color: Colors.grey, fontSize: 30),
        )
      ],
    ),
  ));
}
