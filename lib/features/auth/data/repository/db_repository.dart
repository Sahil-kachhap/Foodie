import 'package:appwrite/appwrite.dart';
import 'package:foodopia/features/auth/data/DTO/user.dart';
import 'package:foodopia/features/auth/data/data_sources/db_data_source.dart';

class DbRepository {
  final DbDataSource dbDataSource = DbDataSource();

  addData(AppUser user) async {
    try {
      await dbDataSource.addUserData(user);
    } on AppwriteException catch (e) {
      throw e.toString();
    }
  }
}
