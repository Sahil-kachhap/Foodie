import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipieFeedPost extends StatelessWidget {
  const RecipieFeedPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("assets/me.jpg"),
                    backgroundColor: Colors.amber,
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
              Icon(Icons.more_horiz),
            ],
          ),
        ),
        Image.asset("assets/recipie.jpg"),
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
        const Text("\tThis is a recipie of a cake"),
        const Text("\t5 minutes ago"),
      ],
    );
  }
}
