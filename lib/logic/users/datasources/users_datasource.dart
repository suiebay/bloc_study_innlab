import 'package:dio/dio.dart';

abstract class UsersRemoteDataSource {
  Future<Response> getUsersList();
  Future<Response> getUserOnly(String id);

}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getUsersList() async {
    print("I am making API call to backend");
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users');
    print("I got data from backend");
    return response;
  }

  @override
  Future<Response> getUserOnly(String id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users/$id');
    return response;
  }
}