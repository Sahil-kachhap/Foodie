import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart';
import 'package:foodopia/features/post/data/DTO/post.dart';
import 'package:foodopia/features/post/data/data_sources/post_db_source.dart';

class PostRepository {
  final PostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();

  uploadPost(Post post, String filePath) async {
    try {
      String uploadedFileId = await postRemoteDataSource.storePostFile(filePath, post.fileId);
      post.fileId = uploadedFileId;
      await postRemoteDataSource.addPost(post);
    } on AppwriteException catch (e) {
      throw e.toString();
    }
  }

  Future<List<Post>> getUserPosts(String username) async{
    try{
      final posts = await postRemoteDataSource.getAllUserPosts(username);
      return posts.map((e) => Post.fromJson(e.data)).toList();
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }

  Future<List<Post>> getPosts() async {
    final posts = await postRemoteDataSource.getAllPosts();
    return posts.map((e) => Post.fromJson(e.data)).toList();
  }

  Future<Uint8List> getPostContent(String fileId) async {
    return await postRemoteDataSource.getPostFile(fileId);
  }
}
