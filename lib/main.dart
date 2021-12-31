import 'package:bloc_study/logic/users/bloc/user_bloc.dart';
import 'package:bloc_study/screens/users/widget/custim_square_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';

void main() {
  initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => sl<UsersBloc>(),
          child: const MyHomePage(title: 'Flutter Demo Home Page')
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if(state is UsersInitial) {
            return Center(
              child: Text(
                "Initial State, али дым загружать еткен жокпыз"
              ),
            );
          }
          if(state is UsersLoading) {
            return Center(
              child: CupertinoActivityIndicator(radius: 40,),
            );
          }
          if(state is UsersSuccess) {
            return ListView.separated(
              itemBuilder: (context, index) =>
                CustomSquareWidget(title: state.usersList[index].name),
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: state.usersList.length
            );
          }
          if(state is UsersFailure) {

            return Center(
              child: Text(
                state.errorMessage
              ),
            );
          }
          return Offstage();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<UsersBloc>(context).add(PleaseLoadUsersList());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
