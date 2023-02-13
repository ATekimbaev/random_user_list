import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_12_00/bloc/get_users_bloc.dart';
import 'package:random_user_12_00/dio_settings.dart';
import 'package:random_user_12_00/get_users_repo.dart';
import 'package:random_user_12_00/input_users_count_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetUsersRepo(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => GetUsersBloc(
          repo: RepositoryProvider.of<GetUsersRepo>(context),
        ),
        child: const MaterialApp(
          home: InputUsersCountPage(),
        ),
      ),
    );
  }
}
