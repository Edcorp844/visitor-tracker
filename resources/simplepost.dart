import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:visitortracker/resources/action_button.dart';

void post(TextEditingController controller) {
  print(controller.text);
}

void writeNewPost(String uid, String username, String picture, String title,
    String body) async {
  // A post entry.
  final postData = {
    'author': username,
    'uid': uid,
    'body': body,
    'title': title,
    'starCount': 0,
    'authorPic': picture,
  };

  // Get a key for a new Post.
  final newPostKey = FirebaseDatabase.instance.ref().child('posts').push().key;

  // Write the new post's data simultaneously in the posts list and the
  // user's post list.
  final Map<String, Map> updates = {};
  updates['/posts/$newPostKey'] = postData;
  updates['/user-posts/$uid/$newPostKey'] = postData;

  return FirebaseDatabase.instance.ref().update(updates);
}

Widget simplePost(TextEditingController controller) {
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('lib/assets/image1.jpg'),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 25.0),
                          hintText: "Post Something...",
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ))),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.5,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.5,
            ),
            Row(
              children: [
                actionButton(Icons.insert_photo_outlined, "Photos",
                    Colors.orange, () {}),
                actionButton(Icons.video_collection_outlined, "Videos",
                    Colors.orange, () {}),
                actionButton(Icons.send_outlined, "Post", Colors.orange, () {
                  writeNewPost("uid", "Kat Edson", "picture", "title", "body");
                })
              ],
            )
          ],
        ),
      ));
}
