import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:foodopia/core/data/appwrite_client.dart';
import 'package:foodopia/core/utils/constants.dart';

class ExploreUsersDataSource{
  final AppWriteClient appWriteClient = AppWriteClient();
  late Databases database;

  ExploreUsersDataSource(){
    database = appWriteClient.getDatabaseInstance;
  }

  Future<List<Document>> getExploreUsers(String name) async{
    try{
      final response = await database.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          Query.search("name", name)
        ]
      );
      return response.documents;
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }
}