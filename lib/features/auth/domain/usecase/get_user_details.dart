import 'package:appwrite/models.dart';
import 'package:cache_manager/cache_manager.dart';
import 'package:foodopia/features/auth/data/repository/auth_repository.dart';

class GetUserDetails {
  final AuthRepository repository = AuthRepository();

  Future<User> getUserData() async {
    User user = await repository.getCurrentLoggedInUser();
    bool userNameExists = await ReadCache.getString(key: "name") == null ? false : true;
    if (!userNameExists) {
      WriteCache.setString(key: "name", value: user.name);
    }
    return user;
  }
}
