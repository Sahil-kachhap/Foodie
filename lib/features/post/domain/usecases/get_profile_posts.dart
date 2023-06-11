import 'package:foodopia/core/utils/get_times_ago.dart';
import 'package:foodopia/features/post/data/repository/post_repository.dart';
import 'package:foodopia/features/post/domain/entities/post_entity.dart';

class GetProfilePosts{
  final PostRepository repository = PostRepository();


  Future<List<PostEntity>> getPosts(String username) async{
    final posts = await repository.getUserPosts(username);
    
    posts.sort((a, b) {
      final timestamp1 = DateTime.fromMicrosecondsSinceEpoch(int.parse(a.createdAt));
      final timestamp2 = DateTime.fromMicrosecondsSinceEpoch(int.parse(b.createdAt));
      return timestamp2.compareTo(timestamp1);
    });

    List<PostEntity> postEntity = [];

    // get images from storage and create PostEntity
    for (final post in posts) {
      final file = await repository.getPostContent(post.fileId);
      final timestamp =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(post.createdAt));
      PostEntity entity =
          PostEntity(post.caption, file, timestamp.toTimeAgo(), post.username);
      postEntity.add(entity);
    }

    return postEntity;

  }
}