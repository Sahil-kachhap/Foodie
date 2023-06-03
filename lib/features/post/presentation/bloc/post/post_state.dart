part of 'post_bloc.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostCreatingState extends PostState {}

class PostLoadingState extends PostState {}

class PostCreatedState extends PostState {}

class PostCreationErrorState extends PostState {
  final String message;

  PostCreationErrorState({
    required this.message,
  });
}

class PostsLoadedState extends PostState {
  final List<PostEntity> posts;

  PostsLoadedState({
    required this.posts,
  });
}

class ProfilePostsLoadedState extends PostState {
  final List<PostEntity> posts;

  ProfilePostsLoadedState({
    required this.posts,
  });
}