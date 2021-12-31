// import 'package:bloc/bloc.dart';
import 'package:bloc_study/logic/users/models/user_model.dart';
import 'package:bloc_study/logic/users/repositories/users_repository.dart';
import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRemoteRepository usersRemoteRepository;

  UsersBloc(this.usersRemoteRepository) : super(UsersInitial());

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is PleaseLoadUsersList) {
      print("I am changing state to LOADING!");
      yield UsersLoading();
      try {
        final List<UserModel> usersList = await usersRemoteRepository.getUsersList();
        print("I am changing state to SUCCESS!");
        yield UsersSuccess(usersList);
      }
      catch (e) {
        print("I am changing state to FAILURE!");
        yield UsersFailure(e.toString());
      }
    }
  }
}
