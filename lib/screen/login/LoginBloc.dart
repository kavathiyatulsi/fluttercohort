import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cohort_app/screen/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cohort_app/screen/login/LoginValidators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cohort_app/common/Toast.dart';

import '../home_screen.dart';

class Blocs extends Object with Validators implements BaseBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();

  // retrieve data from stream
  Stream<String> get name => _name.stream.transform(validateName);

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Stream<bool> get registerSubmitValid =>
      Observable.combineLatest3(_name, email, password, (e, p, s) => true);

  // add data to stream
  Function(String) get changeName => _name.sink.add;

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.stream;

    print('===>$validEmail and $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
    _name.close();
  }

  validAndSubMitOf(FormType _formType, String email, String password,
      String name, BuildContext context) async {
    if (_formType == FormType.login) {
      //Login
      try {
        showLoading(context);
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((onValue) {
          showToast(context, 'Login successfully ');
          debugPrint('Login :-${onValue.user.email}');
          hideLoading(context);
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
        }).catchError((onError) {
          switch (onError) {
            case "ERROR_WRONG_PASSWORD":
              {
                showToast(context, "Password doesn\'t match your email.");
              }
              break;
            case 'ERROR_TOO_MANY_REQUESTS':
              {
                showToast(context, "Please try again later");
              }
              break;
            case 'ERROR_USER_NOT_FOUND':
              {
                showToast(context,
                    "There is no user with such entries. Please try again.");
              }
              break;
          }
          debugPrint("=catchError===>$onError");
        });
      } catch (error) {
        debugPrint('error:-${error.hashCode}');
      }
    } else {
      // Register
      try {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((currentUser) {
          Firestore.instance.collection('users').document().setData({
            "uid": currentUser.user.uid,
            'email': email,
            'fname': "test"
          }).then((onValue) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => HomeScreen()));
          });
        }).catchError((onError) {
          switch (onError.code) {
            case "ERROR_EMAIL_ALREADY_IN_USE":
              {
                showToast(context, "This email is already in use.");
              }
              break;
            case "ERROR_WEAK_PASSWORD":
              {
                showToast(
                    context, "The password must be 6 characters long or more.");
              }
              break;
            default:
              {}
          }
        });
      } catch (error) {}
    }
  }



}
showLoading(BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}

hideLoading(BuildContext context) {
  Navigator.pop(context);
}
abstract class BaseBloc {
  void dispose();
}
