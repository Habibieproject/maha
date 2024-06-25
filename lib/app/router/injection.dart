import 'package:get_it/get_it.dart';
import 'package:maha/app/bloc/bottom_navigator/tab_cubit.dart';
import 'package:maha/app/bloc/user/user_cubit.dart';
import 'package:maha/app/data/repo/user/user_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(
    () => BottomNavCubit(),
  );
  getIt.registerLazySingleton(
    () => UserCubit(
      UserRepository(),
    ),
  );
}
