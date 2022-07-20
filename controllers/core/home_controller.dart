import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visitortracker/controllers/others/profile_controller.dart';
import 'package:visitortracker/resources/feedbox.dart';
import 'package:visitortracker/resources/simplepost.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postController = TextEditingController();

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Home",
          style: GoogleFonts.bebasNeue(fontSize: 40),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              },
              icon: const Icon(Icons.account_circle_outlined))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            simplePost(postController),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  feedBox('lib/assets/image2.jpg', "Kat Edson", "",
                      postController.text, "lib/assets/image3.jpg"),
                  feedBox('lib/assets/image1.jpg', "Kat Edson", "",
                      "Buffallos of L.Mburo", "lib/assets/image4.jpg"),
                  feedBox('lib/assets/image3.jpg', "Kat Edson", "",
                      "Buffallos of L.Mburo", ""),
                  feedBox(
                      'lib/assets/image1.jpg',
                      "Kat Edson",
                      "Do I look great?",
                      "Buffallos of L.Mburo",
                      "lib/assets/image2.jpg"),
                  feedBox('lib/assets/image1.jpg', "Frost", "",
                      "Some Random Post", "lib/assets/image1.jpg"),
                  feedBox('lib/assets/image1.jpg', "Frost", "",
                      "Some Random Post", "lib/assets/image2.jpg"),
                  feedBox('lib/assets/image1.jpg', "Frost", "",
                      "Some Random Post", "lib/assets/image3.jpg")
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
