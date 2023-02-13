part of 'get_users_bloc.dart';

@immutable
abstract class GetUsersState {}

class GetUsersInitial extends GetUsersState {}

class GetUsersSucces extends GetUsersState {
  final UsersModelList model;

  GetUsersSucces({required this.model});
}

class GetUsersError extends GetUsersState {}
