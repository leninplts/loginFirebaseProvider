import 'package:flutter/material.dart';
import 'package:login/login_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, LoginState value, child) =>
              (value.isLoading()) ? CircularProgressIndicator() : child,
          child: RaisedButton(
            child: Text("Iniciar Sesion"),
            color: Colors.purpleAccent,
            onPressed: () => context.read<LoginState>().login(),
          ),
        ),
      ),
    );
  }
}
