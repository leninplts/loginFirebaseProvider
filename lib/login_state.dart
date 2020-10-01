import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences _prefs;

  bool _loggedIn = false;
  bool _loading = false;
  User _user;

  LoginState() {
    loginState();
  }

  User currentUser() => _user;

  bool isLoggedIn() => _loggedIn;

  bool isLoading() => _loading;

  void login() async {
    _loading = true;
    notifyListeners();

    _user = await _signInWithGoogle();

    _loading = false;
    if (_user != null) {
      _prefs.setBool('isLoggedIn', true);
      _loggedIn = true;
      notifyListeners();
    } else {
      _loggedIn = false;
      notifyListeners();
    }
  }

  void logout() {
    _prefs.clear();
    _googleSignIn.signOut();
    _loggedIn = false;
    notifyListeners();
  }

  Future<User> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    _user = (await _auth.signInWithCredential(credential)).user;
    print("User logged as: ");
    print(_user);

    return _user;
  }

  void loginState() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.containsKey("isLoggedIn")) {
      _user = _auth.currentUser;
      _loggedIn = _user != null;
      _loading = false;
      print("\n");
      print(_user);
      notifyListeners();
    } else {
      _loading = false;
      notifyListeners();
    }
  }
}
