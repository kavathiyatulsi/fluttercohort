import 'package:cohort_app/screen/login_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

import 'raised_gradient_button.dart';

enum FormType { login, register }

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
    // _passwordVisible = false;
  }

  var _formKey = GlobalKey<FormState>();
  FormType _formType;

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
                singUp,
                style: Theme.of(context).textTheme.body2.apply(color: gray),
              ),
              sizeBox(30.0),
              TextFormField(
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
                          .apply(color: black))),
              sizeBox(10.0),
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
                          //_passwordVisible = true;
                        });
                      },
                      onLongPressUp: () {
                        setState(() {
                          //_passwordVisible = false;
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
              CommonButton(
                child: Text(
                  register,
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
            alreadyAccount,
            style: Theme.of(context).textTheme.body2.apply(color: black),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            child: Text(
              loginHere,
              style: Theme.of(context).textTheme.body2.apply(color: blue),
            ),
          )
        ],
      ),
    );
  }
}
