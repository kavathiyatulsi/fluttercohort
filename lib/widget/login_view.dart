import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cohort_app/common/Toast.dart';
import 'package:cohort_app/screen/login_screen.dart';
import 'package:cohort_app/screen/register_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/utils/auth.dart';
import 'package:cohort_app/utils/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'raised_gradient_button.dart';

enum FormType { login, register }

class LoginView extends StatefulWidget {
  final String title;
  final String btnName;
  final bool isLogin;
  final String accountLabel;
  final BaseAuth auth;

  LoginView(
      this.btnName, this.title, this.isLogin, this.accountLabel, this.auth);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  var _formKey = GlobalKey<FormState>();
  FormType _formType;
  String _email;
  String _password;
  String _name;

  @override
  Widget build(BuildContext context) {
    widget.isLogin ? _formType = FormType.login : _formType = FormType.register;
    return Form(
      key: _formKey,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                welcome,
                style: Theme.of(context).textTheme.body1.apply(
                      color: black,
                    ),
              ),
              sizeBox(5.0),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.body2.apply(color: gray),
              ),
              sizeBox(30.0),
              !widget.isLogin
                  ? TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return errorFullName;
                        }
                      },
                      decoration: inPutDecoration(fullName),
                      onSaved: (value) => _name = value)
                  : sizeBox(0.0),
              !widget.isLogin ? sizeBox(10.0) : sizeBox(0.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  if (value.isEmpty) {
                    return errorEmail;
                  } else if (emailValidator(value)) {
                    return errorEmailFormat;
                  }
                },
                onSaved: (value) => _email = value,
                decoration: inPutDecoration(email),
              ),
              sizeBox(10.0),
              TextFormField(
                obscureText: _passwordVisible,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return errorPassword;
                  } else if (value.length < 8) {
                    return errorPasswordLength;
                  }
                },
                onSaved: (value) => _password = value,
                decoration: new InputDecoration(
                    enabledBorder: inputBorder(),
                    hintText: password,
                    fillColor: black,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: blue,
                      ),
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(color: black)),
              ),
              sizeBox(15.0),
              Visibility(
                visible: widget.isLogin,
                child: Container(
                  alignment: Alignment(1.0, -1.0),
                  child: Text(
                    forgotPassword,
                    style:
                        Theme.of(context).textTheme.display2.apply(color: blue),
                  ),
                ),
              ),
              sizeBox(15.0),
              CommonButton(
                child: Text(
                  widget.btnName,
                  style: Theme.of(context).textTheme.body2.apply(color: white),
                ),
                gradient:
                    LinearGradient(colors: <Color>[blue, blue, lightBlue]),
                onPressed: () {
                  var user = validAndSubMit();
                },
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: createAccountLabel(),
              )
            ],
          ),
        ),
      ),
    );
  }

  sizeBox(double size) {
    return SizedBox(
      height: size,
    );
  }

  Future<String> signUp() async {
    AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: _password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  void validAndSubMit() async {
    if (validAndSave()) {
      if (_formType == FormType.login) {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((currentUser) => Firestore.instance
                .collection("users")
                .document()
                .setData({
                  "uid": currentUser.user.uid,
                  "fname": _name,
                  "email": _email,
                })
                .then((result) => {
                      showToast(context, 'Login successfully '),
                      debugPrint(
                          'Login :-${currentUser.user.getIdToken(refresh: true)}')
                    })
                .catchError((err) => print(err)))
            .catchError((err) => print(err));
      } else {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .then((currentUser) => Firestore.instance
                .collection("users")
                .document()
                .setData({
                  "uid": currentUser.user.uid,
                  "fname": _name,
                  "email": _email,
                })
                .then((result) => {
                      showToast(context, 'Register successfully '),
                      debugPrint('Register:-')
                    })
                .catchError((err) => print(err)))
            .catchError((err) => print(err));
      }
    }
  }

  bool validAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  inPutDecoration(String types) {
    return InputDecoration(
        enabledBorder: inputBorder(),
        hintText: types,
        fillColor: black,
        hintStyle: Theme.of(context).textTheme.display1.apply(color: black));
  }

  inputBorder() {
    return UnderlineInputBorder(borderSide: BorderSide(color: transparent));
  }

  Widget createAccountLabel() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.accountLabel,
            style: Theme.of(context).textTheme.body2.apply(color: black),
          ),
          GestureDetector(
            onTap: () {
              if (widget.isLogin) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => RegisterScreen()));
              } else {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LoginScreen()));
              }
            },
            child: Text(
              widget.isLogin ? registerHere : loginHere,
              style: Theme.of(context).textTheme.body2.apply(color: blue),
            ),
          )
        ],
      ),
    );
  }
}
