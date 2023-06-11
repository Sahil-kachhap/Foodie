import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodopia/features/explore/domain/entity/search_entity.dart';
import 'package:foodopia/features/explore/domain/usecase/search_users.dart';

part 'explore_user_event.dart';
part 'explore_user_state.dart';

class ExploreUserBloc extends Bloc<ExploreUserEvent, ExploreUserState> {
  final SearchUsers searchUsers = SearchUsers();
  ExploreUserBloc() : super(ExploreUserInitial()) {
    on<SearchUser>((event, emit) async{
      emit(SearchingUser());
      try{
        List<SearchEntity> users = await searchUsers.searchUserByName(event.name);
        users.isNotEmpty ? emit(UserFound(users)): emit(UserNotFound());
      }on AppwriteException catch(e){
        emit(ErrorOccured(e.message!));
      }
    });
  }
}
