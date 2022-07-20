import 'package:flutter/material.dart';

Widget feedBox(String avatarUrl, String sender, String date, String contentText,
    String contentImage) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: const Color(0xff262626),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarUrl),
                radius: 25.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sender,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    sender,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w100),
                  )
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (contentText != "")
            Text(
              contentText,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          const SizedBox(
            height: 10.0,
          ),
          if (contentImage != "") Image.asset(contentImage),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    ),
  );
}
