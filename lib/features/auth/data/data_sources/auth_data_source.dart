import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:foodopia/core/data/appwrite_client.dart';

class AuthDataSource {
  AppWriteClient appWriteClient = AppWriteClient();
  late Account account;

  AuthDataSource() {
    account = appWriteClient.getAccountInstance;
  }

  // register user
  Future<User> signup(String email, String password, String name) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );

      return user;
    } on AppwriteException catch (e) {
      log(e.message.toString());
      throw e.message.toString();
    }
  }

  Future<User> getCurrentUser() async{
    final user = await account.get();
    return user;
  }

  // login user
  Future<Session> login(String email, String password){
    try {
      final session = account.createEmailSession(
        email: email,
        password: password,
      );

      return session;
    } on AppwriteException catch (e) {
      log(e.message.toString());
      throw e.message.toString();
    }
  }
}
