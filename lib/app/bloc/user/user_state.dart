part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  final List<User> oldUsers;
  final bool isFirstFetch;

  const UserLoading(this.oldUsers, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldUsers, isFirstFetch];
}

class UserLoaded extends UserState {
  final List<User> users;

  const UserLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserPosted extends UserState {
  final Map<String, dynamic> response;

  const UserPosted(this.response);

  @override
  List<Object> get props => [response];
}

class PostHistoryLoaded extends UserState {
  final List<Map<String, dynamic>> postHistory;

  const PostHistoryLoaded(this.postHistory);

  @override
  List<Object> get props => [postHistory];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
