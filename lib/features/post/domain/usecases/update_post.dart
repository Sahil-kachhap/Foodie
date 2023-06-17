import 'package:foodopia/features/post/data/DTO/post.dart';
import 'package:foodopia/features/post/data/repository/post_repository.dart';

class UpdatePost {
  final PostRepository repository = PostRepository();

  updatePostLikes(Post post) async {
    try {
      await repository.updateLikesCount(post);
    } catch (e) {
      throw e.toString();
    }
  }
}
