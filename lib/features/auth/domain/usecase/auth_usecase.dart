import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:foodopia/features/auth/data/DTO/user.dart';
import 'package:foodopia/features/auth/data/repository/auth_repository.dart';
import 'package:foodopia/features/auth/data/repository/db_repository.dart';
import 'package:foodopia/features/auth/domain/entity/user_entity.dart';

class AuthUsecase{
  final AuthRepository authRepository = AuthRepository();
  final DbRepository dbRepository = DbRepository();

  Future performRegisteration(UserEntity userEntity) async {
    try{
      authRepository.registerUser(userEntity.email!, userEntity.password!, userEntity.name!).then((value) async{
        AppUser user = AppUser(
          userId: value.$id,
          profileId: ID.unique(),
          name: value.name,
          email: value.email,
          avatarUrl: "",
          bio: "",
          createdAt: DateTime.now().microsecondsSinceEpoch.toString(),
          updatedAt: DateTime.now().microsecondsSinceEpoch.toString(),
        );

        await dbRepository.addData(user);
      });
    }catch (e){
      throw e.toString();
    }
  }

  Future<Session> performLogin(String email, String password) async {
    try{
      return await authRepository.loginUser(email, password);
    }catch (e){
      throw e.toString();
    }
  }
}