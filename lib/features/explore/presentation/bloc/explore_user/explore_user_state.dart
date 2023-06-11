part of 'explore_user_bloc.dart';

abstract class ExploreUserState {}

class ExploreUserInitial extends ExploreUserState {}

class SearchingUser extends ExploreUserState {}

class UserFound extends ExploreUserState {
  final List<SearchEntity> users;
  UserFound(this.users);
}

class UserNotFound extends ExploreUserState {}

class ErrorOccured extends ExploreUserState {
  final String message;
  ErrorOccured(this.message);
}
