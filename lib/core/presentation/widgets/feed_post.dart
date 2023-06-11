import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodopia/core/presentation/widgets/comments_screen.dart';
import 'package:foodopia/core/presentation/widgets/like_animation.dart';
import 'package:foodopia/features/post/domain/entities/post_entity.dart';

class RecipieFeedPost extends StatefulWidget {
  final PostEntity? postEntity;
  const RecipieFeedPost({
    this.postEntity,
    super.key,
  });

  @override
  State<RecipieFeedPost> createState() => _RecipieFeedPostState();
}

class _RecipieFeedPostState extends State<RecipieFeedPost> {
  bool isLikeAnimating = false;
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
                    widget.postEntity?.userName ?? "No Data",
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
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              isLikeAnimating = true;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.memory(widget.postEntity!.file),
               AnimatedOpacity(
                  duration: const Duration(milliseconds: 200,),
                  opacity: isLikeAnimating ? 1.0 : 0.0,
                 child: LikeAnimantion(
                  isAnimating: isLikeAnimating,
                  duration: const Duration(milliseconds: 400,),
                  onEnd: (){
                    setState(() {
                      isLikeAnimating = false;
                    });
                  },
                  child: const Icon(Icons.favorite, color: Colors.white, size: 100.0,),
                ),
               ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                LikeAnimantion(
                  isAnimating: false,
                  smallLike: true,
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.heart),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.comment),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommentScreen(),
                      ),
                    );
                  },
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
        Text("\t${widget.postEntity?.caption ?? "No Data"}"),
        Text("\t${widget.postEntity?.timeAgo ?? "No Data"}"),
      ],
    );
  }
}
