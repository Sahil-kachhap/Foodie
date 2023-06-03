import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/services.dart';
import 'package:foodopia/core/data/appwrite_client.dart';
import 'package:foodopia/core/utils/constans.dart';
import 'package:foodopia/features/post/data/DTO/post.dart';

class PostRemoteDataSource{
  AppWriteClient appWriteClient = AppWriteClient();
  late Databases database;
  late Storage storage;

  PostRemoteDataSource(){
    database = appWriteClient.getDatabaseInstance;
    storage = appWriteClient.getStorageInstance;
  }

  // Future<List<PostModel>> getPosts() async {
  //   final response = await client.get(
  //     'https://jsonplaceholder.typicode.com/posts',
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     final posts = json.decode(response.body) as List;
  //     return posts.map((post) => PostModel.fromJson(post)).toList();
  //   } else {
  //     throw ServerException();
  //   }
  // }

  addPost(Post post) async{
    try{
      await database.createDocument(
        databaseId: databaseId,
        collectionId: postCollectionId,
        documentId: ID.unique(),
        data: post.toJson(),
      );
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }

  Future<List<Document>> getAllPosts() async{
    try{
      final posts = await database.listDocuments(
        databaseId: databaseId,
        collectionId: postCollectionId,
      );
      return posts.documents;
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }

  Future<List<Document>> getAllUserPosts(String username) async{
    try{
      final posts = await database.listDocuments(
        databaseId: databaseId,
        collectionId: postCollectionId,
        queries: [
          Query.equal('username', [username])
        ],
      );
      return posts.documents;
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }

  Future<String> storePostFile(String filePath, String fileId) async{
    try{
     final file = await storage.createFile(bucketId: postStorageId, fileId: fileId, file: InputFile.fromPath(path: filePath),);
     return file.$id;
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }

  Future<Uint8List> getPostFile(String fileId) async{
    try{
      final file = await storage.getFileView(bucketId: postStorageId, fileId: fileId);
      return file;
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }
}