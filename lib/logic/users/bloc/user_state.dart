part of 'user_bloc.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersSuccess extends UsersState {
  final List<UserModel> usersList;

  UsersSuccess(this.usersList);
}

class UsersFailure extends UsersState {
  final String errorMessage;

  UsersFailure(this.errorMessage);
}

