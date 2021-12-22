import 'package:dio/dio.dart';

abstract class UsersRemoteDataSource {
  Future<Response> getUsersList();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getUsersList() async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users');
    return response;
  }
}