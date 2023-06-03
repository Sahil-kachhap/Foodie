import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodopia/features/post/presentation/bloc/post/post_bloc.dart';
import 'package:foodopia/features/post/presentation/create_post.dart';
import 'package:foodopia/core/presentation/widgets/feed_post.dart';
import 'package:image_picker/image_picker.dart';

class RecipieFeeds extends StatefulWidget {
  const RecipieFeeds({super.key});

  @override
  State<RecipieFeeds> createState() => _RecipieFeedsState();
}

class _RecipieFeedsState extends State<RecipieFeeds> {
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

  @override
  void initState() {
    BlocProvider.of<PostBloc>(context).add(GetPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text(
                  "Foodie",
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
          body: BlocConsumer<PostBloc, PostState>(
            listener: (context, state) {
              if (state is PostCreationErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is PostsLoadedState) {
                return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return RecipieFeedPost(postEntity: state.posts[index],);
                    });
              }else if(state is PostLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const Center(
                child: Text("Seems like you haven't posted anything yet!"),
              );
            },
          ),
        ),
      ),
    );
  }
}
