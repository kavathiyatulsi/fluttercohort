import 'package:cohort_app/screen/login_screen.dart';
import 'package:cohort_app/screen/register_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

import 'raised_gradient_button.dart';

class LoginView extends StatefulWidget {
  final String title;
  final String btnName;
  final bool isLogin;
  final String accountLabel;

  LoginView(this.btnName, this.title, this.isLogin, this.accountLabel);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    // _passwordVisible = false;
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
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
                      decoration: new InputDecoration(
                          enabledBorder: inputBorder(),
                          hintText: fullName,
                          fillColor: black,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .display1
                              .apply(color: black)))
                  : sizeBox(0.0),
              !widget.isLogin ? sizeBox(10.0) : sizeBox(0.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  if (value.isEmpty) {
                    return errorEmail;
                  }
                },
                decoration: new InputDecoration(
                    enabledBorder: inputBorder(),
                    hintText: email,
                    fillColor: black,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(color: black)),
              ),
              sizeBox(10.0),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return errorPassword;
                  }
                },
                decoration: new InputDecoration(
                    enabledBorder: inputBorder(),
                    hintText: password,
                    fillColor: black,
                    suffixIcon: GestureDetector(
                      onLongPress: () {
                        setState(() {
                          _passwordVisible = true;
                        });
                      },
                      onLongPressUp: () {
                        setState(() {
                          _passwordVisible = false;
                        });
                      },
                      child: Icon(
                        Icons.visibility,
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
                  setState(() {
                    if (_formKey.currentState.validate()) {}
                  });
                },
              ),
              Align(
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
