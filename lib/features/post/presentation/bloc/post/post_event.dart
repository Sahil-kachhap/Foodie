part of 'post_bloc.dart';

abstract class PostEvent {}

class CreatePost extends PostEvent {
  final String caption;
  final String filePath;

  CreatePost({
    required this.caption,
    required this.filePath,
  });
}

class GetPost extends PostEvent {}

class GetUserProfileData extends PostEvent {
  
}