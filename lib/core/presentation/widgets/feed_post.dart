import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodopia/features/post/domain/entities/post_entity.dart';

class RecipieFeedPost extends StatelessWidget {
  final PostEntity? postEntity;
  const RecipieFeedPost({
    this.postEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("assets/me.jpg"),
                    backgroundColor: Colors.amber,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    postEntity?.userName ?? "No Data",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        Image.memory(postEntity!.file),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.heart),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.comment),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.paperPlane),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.bookmark),
              onPressed: () {},
            ),
          ],
        ),
        const Text(
          "\t8 likes",
        ),
        Text("\t${postEntity?.caption ?? "No Data"}"),
        Text("\t${postEntity?.timeAgo ?? "No Data"}"),
      ],
    );
  }
}
