import 'package:appwrite/models.dart';
import 'package:foodopia/features/auth/data/data_sources/auth_data_source.dart';

class AuthRepository{
  final AuthDataSource authDataSource = AuthDataSource();

  Future<User> registerUser(String email, String password, String name) async{
    try{
      return await authDataSource.signup(email, password, name);
    }catch(e){
      throw e.toString();
    }
  }

  Future<Session> loginUser(String email, String password) async{
    try{
      return await authDataSource.login(email, password);
    }catch(e){
      throw e.toString();
    }
  }
}