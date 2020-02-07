import 'package:cohort_app/screen/login/LoginBloc.dart';
import 'package:cohort_app/screen/register/register_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/utils/auth.dart';
import 'package:flutter/material.dart';
import '../../widget/RaisedGradientButton.dart';
import 'login_screen.dart';

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
  var bloc = Blocs();
  var _formKey = GlobalKey<FormState>();
  FormType _formType;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    widget.isLogin ? _formType = FormType.login : _formType = FormType.register;
    return Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
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
                      style:
                          Theme.of(context).textTheme.body2.apply(color: gray),
                    ),
                    sizeBox(30.0),
                    !widget.isLogin
                        ? StreamBuilder(
                            stream: bloc.name,
                            builder: (context, snapshote) => TextField(
                              keyboardType: TextInputType.text,
                              controller: _nameController,
                              onChanged: bloc.changeName,
                              decoration:
                                  inPutDecoration(fullName, snapshote.error),
                            ),
                          )
                        : sizeBox(0.0),
                    !widget.isLogin ? sizeBox(10.0) : sizeBox(0.0),
                    fieldEmail(),
                    sizeBox(18.0),
                    fieldPassword(),
                    sizeBox(20.0),
                    forgotPasswordText(),
                    sizeBox(25.0),
                    loginButton()
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: createAccountLabel(),
              ),
            ),
          )
        ],
      ),
    );
  }

  sizeBox(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget forgotPasswordText() => Visibility(
        visible: widget.isLogin,
        child: Container(
          alignment: Alignment(1.0, -1.0),
          child: Text(
            forgotPassword,
            style: Theme.of(context).textTheme.display2.apply(color: blue),
          ),
        ),
      );

  Widget fieldEmail() => StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snapshote) => TextField(
          controller: _emailController,
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: inPutDecoration(email, snapshote.error),
        ),
      );

  Widget fieldPassword() => StreamBuilder<String>(
        stream: bloc.password,
        builder: (context, snapshote) => TextField(
          controller: _passwordController,
          onChanged: bloc.changePassword,
          obscureText: _passwordVisible,
          keyboardType: TextInputType.visiblePassword,
          decoration: new InputDecoration(
              enabledBorder: inputBorder(),
              hintText: password,
              labelText: password,
              fillColor: black,
              errorText: snapshote.error,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _passwordVisible = !_passwordVisible;
                  });
                },
                child: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: blue,
                ),
              ),
              hintStyle:
                  Theme.of(context).textTheme.display1.apply(color: black)),
        ),
      );

  Widget loginButton() => StreamBuilder<bool>(
        stream: _formType == FormType.login
            ? bloc.submitValid
            : bloc.registerSubmitValid,
        builder: (context, snapshot) => RaisedGradientButton(
            child: Text(
              widget.btnName,
              style: Theme.of(context).textTheme.body2.apply(color: white),
            ),
            gradient: LinearGradient(colors: <Color>[blue, blue, lightBlue]),
            isEnable: snapshot.hasData && snapshot.data == true ? true : false,
            onPressed: snapshot.hasData && snapshot.data
                ? () => bloc.validAndSubMitOf(_formType, _emailController.text,
                    _passwordController.text, _nameController.text, context)
                : null),
      );

  inPutDecoration(String types, Object error) {
    return InputDecoration(
        enabledBorder: inputBorder(),
        hintText: types,
        labelText: types,
        fillColor: black,
        errorText: error,
        hintStyle: Theme.of(context).textTheme.display1.apply(color: black));
  }

  inputBorder() {
    return UnderlineInputBorder(borderSide: BorderSide(color: lightGray));
  }

  Widget createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
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

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
