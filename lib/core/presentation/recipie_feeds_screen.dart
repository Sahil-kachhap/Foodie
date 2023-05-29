import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodopia/core/presentation/create_post.dart';
import 'package:foodopia/core/presentation/widgets/feed_post.dart';
import 'package:image_picker/image_picker.dart';

class RecipieFeeds extends StatefulWidget {
  const RecipieFeeds({super.key});

  @override
  State<RecipieFeeds> createState() => _RecipieFeedsState();
}

class _RecipieFeedsState extends State<RecipieFeeds> {
  @override
  Widget build(BuildContext context) {
    File? image;

    Future pickImage() async {
      try {
        final imageFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (imageFile == null) return;
        final imageTemp = File(imageFile.path);
        setState(() => image = imageTemp);
      } on PlatformException catch (e) {
        log('Failed to pick image: $e');
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Foodopia",
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         pickImage().then((value) {
      //           if (image != null) {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => CreatePostScreen(
      //                   file: image!,
      //                 ),
      //               ),
      //             );
      //           }
      //         });
      //       },
      //       icon: const Icon(FontAwesomeIcons.squarePlus),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text(
                  "Foodopia",
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      pickImage().then((value) {
                        if (image != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreatePostScreen(
                                file: image!,
                              ),
                            ),
                          );
                        }
                      });
                    },
                    icon: const Icon(FontAwesomeIcons.squarePlus),
                  ),
                ],
              )
            ];
          },
          body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const RecipieFeedPost();
              }),
        ),
      ),
    );
  }
}
