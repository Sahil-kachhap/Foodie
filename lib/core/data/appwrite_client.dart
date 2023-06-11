import 'package:appwrite/appwrite.dart';
import 'package:foodopia/core/utils/constants.dart';

class AppWriteClient{
   final Client? client = Client();
   Account? account;
   Databases? databases;
   Storage? storage;
   Realtime? realtime;
   Avatars? avatars;

   AppWriteClient(){
      init();
   }

   init() {
     client!.setEndpoint(appwriteEndpoint).setProject(appwriteProjectId).setSelfSigned(); 
     account = Account(client!);
     databases = Databases(client!);
     storage = Storage(client!);
     realtime = Realtime(client!);
     avatars = Avatars(client!);
   }

    Account get getAccountInstance => account!;
    Databases get getDatabaseInstance => databases!;
    Storage get getStorageInstance => storage!;
    Realtime get getRealtimeInstance => realtime!;
    Avatars get getAvatarsInstance => avatars!;
}