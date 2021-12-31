import 'package:bloc_study/logic/users/datasources/users_datasource.dart';
import 'package:bloc_study/logic/users/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class UsersRemoteRepository {
  Future<List<UserModel>> getUsersList();
  Future<UserModel> getUserOnly(String id);
}

class UsersRemoteRepositoryImpl implements UsersRemoteRepository {
  final UsersRemoteDataSource usersRemoteDataSource;

  UsersRemoteRepositoryImpl(this.usersRemoteDataSource);

  @override
  Future<List<UserModel>> getUsersList() async {
    print("I am calling datasource function to get user list");
    Response response = await usersRemoteDataSource.getUsersList();
    print("I am converting data to user model");
    return (response.data as List).map((i) => UserModel.fromJson(i)).toList();
  }

  @override
  Future<UserModel> getUserOnly(String id) async {
    Response response = await usersRemoteDataSource.getUserOnly(id);
    return UserModel.fromJson(response.data);
  }
}