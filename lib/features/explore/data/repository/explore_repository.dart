import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:foodopia/features/auth/data/DTO/user.dart';
import 'package:foodopia/features/explore/data/data_sources/explore_data_source.dart';

class ExploreUserRepository{
  final ExploreUsersDataSource exploreUserDataSource = ExploreUsersDataSource();

  Future<List<AppUser>> getUsers(String name) async{
    try{
      List<Document> documents = await exploreUserDataSource.getExploreUsers(name);
      return documents.map((e) => AppUser.fromJson(e.data)).toList();
    }on AppwriteException catch(e){
      throw e.toString();
    }
  }
}