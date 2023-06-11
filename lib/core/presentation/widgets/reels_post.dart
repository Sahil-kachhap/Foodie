import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelsPost extends StatefulWidget {
  //final Post? post;
  const ReelsPost({super.key});

  @override
  State<ReelsPost> createState() => _ReelsPostState();
}

class _ReelsPostState extends State<ReelsPost> {
  late VideoPlayerController controller;
  late ChewieController chewieController;

  @override
  void initState() {
    controller = VideoPlayerController.contentUri(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((value) {
        setState(() {});
        controller.play();
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(controller.dataSource),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          controller.play();
        } else {
          if (mounted) {
            controller.pause();
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          });
        },
        child: !controller.value.isInitialized
            ? const Center(child: CircularProgressIndicator(),)
            : AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(controller),
                    const Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.2, 0.8, 1.0],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 125,
                          width: MediaQuery.of(context).size.width * 0.75,
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@sahilkachhap',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Here comes the caption!",
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: controller.value.size.height,
                        width: MediaQuery.of(context).size.width * 0.2,
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            VideoActions(
                              icon: Icons.favorite,
                              value: '11.4k',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            VideoActions(
                              icon: Icons.comment,
                              value: '1.4k',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            VideoActions(
                              icon: Icons.forward_rounded,
                              value: '440k',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData? icon;
  final String? value;

  const VideoActions({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: Ink(
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: Icon(icon),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value!,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
