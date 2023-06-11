part of 'explore_user_bloc.dart';

abstract class ExploreUserEvent {}

class SearchUser extends ExploreUserEvent {
  final String name;
  SearchUser(this.name);
}