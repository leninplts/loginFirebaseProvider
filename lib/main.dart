import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/src/bloc/authentication/authentication_bloc.dart';
import 'package:login/src/repository/user_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

/*
  Login With providers
*/
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:login/login_state.dart';
// import 'package:login/pages/home_page.dart';
// import 'package:login/pages/login_page.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<LoginState>(
//       create: (BuildContext context) => LoginState(),
//       child: MaterialApp(
//         title: 'Material App',
//         debugShowCheckedModeBanner: false,
//         routes: {
//           '/': (BuildContext context) {
//             var state = Provider.of<LoginState>(context);
//             if (state.isLoggedIn()) {
//               return HomePage();
//             } else {
//               return LoginPage();
//             }
//           },
//           '/HomePage': (context) => HomePage(),
//         },
//       ),
//     );
//   }
// }
