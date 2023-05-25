import 'package:appwrite/models.dart';
import 'package:foodopia/features/auth/data/repository/auth_repository.dart';

class AuthUsecase{
  final AuthRepository authRepository = AuthRepository();
  Future<User> performRegisteration(String email, String password, String name) async {
    try{
      return await authRepository.registerUser(email, password, name);
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