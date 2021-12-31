import 'package:get_it/get_it.dart';

import 'logic/users/bloc/user_bloc.dart';
import 'logic/users/datasources/users_datasource.dart';
import 'logic/users/repositories/users_repository.dart';

var sl = GetIt.instance;

void initGetIt() async {
  sl.registerFactory<UsersBloc>(() => UsersBloc(sl()));

  sl.registerLazySingleton<UsersRemoteRepository>(() => UsersRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<UsersRemoteDataSource>(() => UsersRemoteDataSourceImpl());
}
