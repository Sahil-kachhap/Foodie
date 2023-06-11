import 'package:foodopia/features/auth/data/DTO/user.dart';
import 'package:foodopia/features/explore/data/repository/explore_repository.dart';
import 'package:foodopia/features/explore/domain/entity/search_entity.dart';

class SearchUsers{
  final ExploreUserRepository repository = ExploreUserRepository();

  Future<List<SearchEntity>> searchUserByName(String name) async{
    List<AppUser> users = await repository.getUsers(name);
    return users.map((e) => SearchEntity(name: e.name, bio: e.bio)).toList();
  }
}