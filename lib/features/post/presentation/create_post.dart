import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodopia/features/post/presentation/bloc/post/post_bloc.dart';

class CreatePostScreen extends StatefulWidget {
  final File? file;
  const CreatePostScreen({this.file, super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController captionController = TextEditingController();
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
              onPressed: () {
                BlocProvider.of<PostBloc>(context).add(
                  CreatePost(
                    caption: captionController.text,
                    filePath: widget.file!.path,
                  ),
                );
              },
              child: const Text("Post"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostCreatedState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Recipe posted successfully"),
                ),
              );
            }

            if (state is PostCreationErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }

            if (state is PostCreatingState) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
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
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: TextField(
                  controller: captionController,
                  decoration: const InputDecoration(
                    hintText: "Say something about this...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Image.file(widget.file!),
            ],
          ),
        ),
      ),
    );
  }
}
