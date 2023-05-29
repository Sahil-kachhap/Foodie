import 'dart:io';

import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  final File? file;
  const CreatePostScreen({this.file, super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create post"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
              onPressed: () {},
              child: const Text("Post"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("assets/me.jpg"),
                    backgroundColor: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "sahilkachhap",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Say something about this...",
                  border: InputBorder.none,
                ),
              ),
            ),
            Image.file(widget.file!),
          ],
        ),
      ),
    );
  }
}
