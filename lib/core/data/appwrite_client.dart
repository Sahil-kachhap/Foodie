import 'package:appwrite/appwrite.dart';
import 'package:foodopia/core/utils/constans.dart';

class AppWriteClient{
   final Client? client = Client();
   Account? account;
   Databases? databases;

   AppWriteClient(){
      init();
   }

   init() {
     client!.setEndpoint(appwriteEndpoint).setProject(appwriteProjectId).setSelfSigned(); 
     account = Account(client!);
     databases = Databases(client!);
   }

    Account get getAccountInstance => account!;
    Databases get getDatabaseInstance => databases!;
}