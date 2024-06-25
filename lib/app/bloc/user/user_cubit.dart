import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maha/app/data/models/response/user_response.dart';
import 'package:maha/app/data/repo/user/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  int _page = 1;
  final List<Map<String, dynamic>> _postHistory = [];

  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> fetchUsers() async {
    if (state is UserLoading) return;

    final currentState = state;
    var oldUsers = <User>[];
    if (currentState is UserLoaded) {
      oldUsers = currentState.users;
    }

    emit(UserLoading(oldUsers, isFirstFetch: _page == 1));

    try {
      final users = await userRepository.fetchUsers(_page);
      _page++;
      final updatedUsers = oldUsers + users;
      emit(UserLoaded(updatedUsers));
    } catch (e) {
      emit(const UserError('Failed to fetch users'));
    }
  }

  Future<void> postUser(String name, String job) async {
    try {
      final response = await userRepository.postUser(name, job);
      _postHistory.add(response);
      emit(UserPosted(response));
      emit(PostHistoryLoaded(List.from(_postHistory)));
    } catch (e) {
      emit(const UserError('Failed to post user'));
    }
  }

  void deletePost(int index) {
    if (index >= 0 && index < _postHistory.length) {
      _postHistory.removeAt(index);
      emit(PostHistoryLoaded(List.from(_postHistory)));
    }
  }

  List<Map<String, dynamic>> get postHistory => List.unmodifiable(_postHistory);
}
