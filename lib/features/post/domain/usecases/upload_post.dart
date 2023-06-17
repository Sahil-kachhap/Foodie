import 'package:appwrite/appwrite.dart';
import 'package:foodopia/core/utils/constants.dart';
import 'package:foodopia/features/auth/data/repository/auth_repository.dart';
import 'package:foodopia/features/post/data/DTO/post.dart';
import 'package:foodopia/features/post/data/repository/post_repository.dart';

class UploadPost{
  final PostRepository postRepository = PostRepository();

  uploadPost(String caption, String filePath) async{
    try{
      final userId = await AuthRepository().getCurrentLoggedInUser().then((value) => value.$id);
      final username = await AuthRepository().getCurrentLoggedInUser().then((value) => value.name);

      Post post = Post(
        userId: userId,
        username: username,
        caption: caption,
        contentType: filePath,
        fileId: ID.unique(),
        fileUrl: imageUrl(ID.unique()),
        likes: [],
        commentIds: [],
        createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
        updatedAt: DateTime.now().microsecondsSinceEpoch.toString(),
      );

      await postRepository.uploadPost(post, filePath);
    }catch(e){
      throw e.toString();
    }
  }
}