part of 'get_users_bloc.dart';

@immutable
abstract class GetUsersEvent {}

class GetUsersListEvent extends GetUsersEvent {
  final int count;
  final String? gender;

  GetUsersListEvent({required this.count, this.gender});
}
