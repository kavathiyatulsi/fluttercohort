import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/login/LoginBloc.dart';
import 'package:cohort_app/screen/register/register_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';


enum FormType { login, register }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible;
  var bloc = Blocs();
  var _formKey = GlobalKey<FormState>();
  FormType _formType;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage(loginBackground),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3 - 20,
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )),
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Form(
                        key: _formKey,
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
                              'Sign in to continue',
                              style: Theme.of(context)
                                  .textTheme
                                  .body2
                                  .apply(color: gray),
                            ),
                            sizeBox(20.0),
                            fieldEmail(),
                            sizeBox(18.0),
                            fieldPassword(),
                            sizeBox(20.0),
                            forgotPasswordText(),
                            sizeBox(25.0),
                            loginButton(),
                            sizeBox(40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't have an account?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .apply(color: black),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                RegisterScreen()));
                                  },
                                  child: Text(
                                    registerHere,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .apply(color: blue),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget forgotPasswordText() => Container(
    alignment: Alignment(1.0, -1.0),
    child: Text(
      forgotPassword,
      style: Theme.of(context).textTheme.display2.apply(color: blue),
    ),
  );

  Widget fieldEmail() => StreamBuilder<String>(
    stream: bloc.email,
    builder: (context, snapshote) => TextField(
      controller: _emailController,
      onChanged: bloc.changeEmail,
      focusNode: _emailFocus,
      textInputAction: TextInputAction.next,
      onSubmitted: (value){
        _emailFocus.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
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
      focusNode: _passwordFocus,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: new InputDecoration(
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
      ),
    ),
  );

  Widget loginButton() => StreamBuilder<bool>(
    stream: bloc.submitValid,
    builder: (context, snapshot) => RaisedGradientButton(
        child: Text(
          'Login',
          style: Theme.of(context).textTheme.body2.apply(color: white),
        ),
        gradient: LinearGradient(colors: <Color>[blue, blue, lightBlue]),
        isEnable: snapshot.hasData && snapshot.data,
        onPressed: () => bloc.validAndSubMitOf(FormType.login, _emailController.text,
            _passwordController.text, '', context)),
  );

  inPutDecoration(String types, Object error) {
    return InputDecoration(
      hintText: types,
      labelText: types,
      fillColor: black,
      errorText: error,
    );
  }
}

