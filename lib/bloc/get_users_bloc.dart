import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_user_12_00/model.dart';

import '../get_users_repo.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  GetUsersBloc({required this.repo}) : super(GetUsersInitial()) {
    on<GetUsersListEvent>(
      (event, emit) async {
        try {
          final model = await repo.getUsersList(
            count: event.count,
            gender: event.gender,
          );
          emit(
            GetUsersSucces(model: model),
          );
        } catch (e) {
          emit(GetUsersError());
        }
      },
    );
  }
  final GetUsersRepo repo;
}
