import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_12_00/bloc/get_users_bloc.dart';
import 'package:random_user_12_00/user_info_page.dart';

class InputUsersCountPage extends StatelessWidget {
  const InputUsersCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController controllerGender = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: BlocBuilder<GetUsersBloc, GetUsersState>(
            builder: (context, state) {
              if (state is GetUsersSucces) {
                return ListView.builder(
                  itemCount: state.model.results?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => UsersCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserInfo(model: state.model.results![index]),
                        ),
                      );
                    },
                    first: state.model.results?[index].name?.first ?? '',
                    last: state.model.results?[index].name?.last ?? '',
                    title: state.model.results?[index].name?.title ?? '',
                    image: state.model.results?[index].picture?.medium ?? '',
                  ),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Users Count',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: controllerGender,
                    decoration: const InputDecoration(
                      hintText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        BlocProvider.of<GetUsersBloc>(context).add(
                          GetUsersListEvent(
                            count: int.parse(controller.text),
                            gender: controllerGender.text,
                          ),
                        );
                      }
                    },
                    child: const Text('Get'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class UsersCard extends StatelessWidget {
  const UsersCard({
    super.key,
    required this.image,
    required this.title,
    required this.first,
    required this.last,
    required this.onTap,
  });

  final String image;
  final String title;
  final String first;
  final String last;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(color: Colors.grey),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(image),
                    ),
                    const SizedBox(width: 30),
                    Text('$title $last $first'),
                  ],
                ),
              ),
              const SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }
}
