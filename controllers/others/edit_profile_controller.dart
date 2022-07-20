import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Edit Profile"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("lib/assets/image1.jpg"),
                    radius: 60.0,
                  )
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: const Color(0xff262626),
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text("First name:"),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text("Frost")
                            ],
                          ),
                          const Divider(
                            height: 1.5,
                            color: Colors.grey,
                          ),
                          Row(
                            children: const [
                              Text("Last name:"),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text("Edson")
                            ],
                          ),
                          const Divider(
                            height: 1.5,
                            color: Colors.grey,
                          ),
                          Row(
                            children: const [
                              Text("Nationality:"),
                              SizedBox(
                                width: 28.0,
                              ),
                              Text("Uganda")
                            ],
                          ),
                          Row(
                            children: const [
                              Text("place visited:"),
                              SizedBox(
                                width: 26.0,
                              ),
                              Text("L.Mburo National Park")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
