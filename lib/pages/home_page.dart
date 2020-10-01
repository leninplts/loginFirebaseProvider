import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/login_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final Function onLogOutSuccess;
  const HomePage({Key key, this.onLogOutSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.watch<LoginState>().currentUser();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL),
              ),
              Text(user.displayName),
              RaisedButton(
                child: Text("Cerrar Sesion"),
                color: Colors.deepOrange,
                onPressed: () => context.read<LoginState>().logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
