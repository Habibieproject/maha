import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maha/app/bloc/user/user_cubit.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';
import 'package:maha/app/data/models/response/user_response.dart';
import 'package:maha/app/data/repo/user/user_repository.dart';
import 'package:maha/app/utils/components/loading/loader_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const id = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepository())..fetchUsers(),
      child: const HomeScreenImpl(),
    );
  }
}

class HomeScreenImpl extends StatefulWidget {
  const HomeScreenImpl({super.key});
  @override
  State<HomeScreenImpl> createState() => _HomeScreenImplState();
}

class _HomeScreenImplState extends State<HomeScreenImpl> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<UserCubit>().fetchUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data User'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserLoading && state.isFirstFetch) {
                  return const Center(child: LoaderProgressCustom());
                }

                List<User> users = [];
                if (state is UserLoading) {
                  users = state.oldUsers;
                } else if (state is UserLoaded) {
                  users = state.users;
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: users.length + (state is UserLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < users.length) {
                      final user = users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text('${user.firstName} ${user.lastName}'),
                        subtitle: Text(user.email),
                      );
                    } else {
                      return const Center(child: LoaderProgressCustom());
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
