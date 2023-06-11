import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodopia/core/data/appwrite_client.dart';
import 'package:foodopia/features/explore/domain/entity/search_entity.dart';
import 'package:foodopia/features/post/domain/entities/post_entity.dart';
import 'package:foodopia/features/post/presentation/bloc/post/post_bloc.dart';

class ProfileScreen extends StatefulWidget {
  final SearchEntity? searchEntity;
  const ProfileScreen({this.searchEntity, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<PostBloc>(context).add(GetUserProfileData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: widget.searchEntity == null
                ? CacheManagerUtils.cacheTextBuilder(
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    cacheKey: "name",
                  )
                : Text(widget.searchEntity!.name!),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FutureBuilder(
                              future: AppWriteClient()
                                  .getAvatarsInstance
                                  .getInitials(
                                      name: widget.searchEntity != null
                                          ? widget.searchEntity!.name!
                                          : null),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          MemoryImage(snapshot.data!));
                                }
                                return const Center(
                                    child: CircularProgressIndicator());
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const Flexible(
                        fit: FlexFit.loose,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileMetrics(
                              count: 0,
                              attributeName: "Posts",
                            ),
                            ProfileMetrics(
                              count: 0,
                              attributeName: "Followers",
                            ),
                            ProfileMetrics(
                              count: 0,
                              attributeName: "Following",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: widget.searchEntity == null
                      ? CacheManagerUtils.cacheTextBuilder(
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          cacheKey: "name",
                        )
                      : Text(widget.searchEntity!.name!),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Lead your life from the front",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  indicatorWeight: 1,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on),
                    ),
                    Tab(
                      icon: Icon(Icons.video_library),
                    ),
                    Tab(
                      icon: Icon(FontAwesomeIcons.bookmark),
                    ),
                  ],
                ),
                BlocConsumer<PostBloc, PostState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ProfilePostsLoadedState) {
                      return Expanded(
                        child: TabBarView(children: [
                          state.posts.isNotEmpty
                              ? ShowImageGrid(
                                  posts: state.posts,
                                )
                              : const NoPostAvailable(),
                          const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.video,
                                  size: 100,
                                ),
                                Text("No Posts Yet"),
                              ],
                            ),
                          ),
                          const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.bookmark,
                                  size: 100,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("No Bookmarks Yet"),
                              ],
                            ),
                          ),
                        ]),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class NoPostAvailable extends StatelessWidget {
  const NoPostAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: 100,
          ),
          Text("No Posts Yet"),
        ],
      ),
    );
  }
}

class ShowImageGrid extends StatelessWidget {
  final List<PostEntity>? posts;
  const ShowImageGrid({
    this.posts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: posts!.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue,
            child: Image.memory(
              posts![index].file,
              fit: BoxFit.cover,
            ),
          );
        });
  }
}

class ProfileMetrics extends StatelessWidget {
  final int? count;
  final String? attributeName;
  const ProfileMetrics({
    this.count,
    this.attributeName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        count.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Text(
        attributeName!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ]);
  }
}
