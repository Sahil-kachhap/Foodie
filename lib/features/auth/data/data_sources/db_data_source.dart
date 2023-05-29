import 'package:appwrite/appwrite.dart';
import 'package:foodopia/core/data/appwrite_client.dart';
import 'package:foodopia/core/utils/constans.dart';
import 'package:foodopia/features/auth/data/DTO/user.dart';

class DbDataSource{
    AppWriteClient appWriteClient = AppWriteClient();
    late Databases database;

    DbDataSource(){
      database = appWriteClient.getDatabaseInstance;
    }

    Future addUserData(AppUser user) async{
      try{
       await database.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: ID.unique(),
          data: user.toJson(),
       );
      } catch(e){
        throw e.toString();
      }
    }
}