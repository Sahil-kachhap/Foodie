import 'package:appwrite/models.dart';
import 'package:foodopia/features/auth/data/repository/auth_repository.dart';

class GetUserDetails{
  final AuthRepository repository = AuthRepository();

  Future<User> getUserData() async{
    User user = await repository.getCurrentLoggedInUser();
    return user;
  }
}