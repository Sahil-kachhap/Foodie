import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodopia/core/presentation/profile_screen.dart';
import 'package:foodopia/features/explore/presentation/bloc/explore_user/explore_user_bloc.dart';

class ExploreUser extends StatefulWidget {
  const ExploreUser({super.key});

  @override
  State<ExploreUser> createState() => _ExploreUserState();
}

class _ExploreUserState extends State<ExploreUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search User"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search User",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onSubmitted: (value) {
                  BlocProvider.of<ExploreUserBloc>(context)
                      .add(SearchUser(value));
                },
              ),
            ),
            BlocBuilder<ExploreUserBloc, ExploreUserState>(
              builder: (context, state) {
                if (state is ExploreUserInitial) {
                  return const Center(
                    child: Text("Search User"),
                  );
                } else if (state is SearchingUser) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UserFound) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          // leading: CircleAvatar(
                          //   backgroundImage: NetworkImage(
                          //     state.users[index].avatarUrl,
                          //   ),
                          // ),
                          title: Text(state.users[index].name!),
                          subtitle: Text(state.users[index].bio!),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(searchEntity: state.users[index],),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (state is UserNotFound) {
                  return const Center(
                    child: Text("User Not Found"),
                  );
                } else if (state is ErrorOccured) {
                  return const Center(
                    child: Text("Error Occured"),
                  );
                } else {
                  return const Center(
                    child: Text("Users will be shown here"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
