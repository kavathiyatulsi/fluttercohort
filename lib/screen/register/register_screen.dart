import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/login/LoginBloc.dart';
import 'package:cohort_app/screen/login/login_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible;
  var bloc = Blocs();
  var _formKey = GlobalKey<FormState>();
  FormType _formType;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  final _fNameFocus = FocusScopeNode();
  final _emailFocus = FocusScopeNode();
  final _passwordFocus = FocusScopeNode();

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
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3,
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage(registerBackground),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3 - 10,
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child:registerView(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget registerView() {
    return Container(
        height: MediaQuery
            .of(context)
            .size
            .height -
            MediaQuery
                .of(context)
                .size
                .height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15))),
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                welcome,
                style: Theme
                    .of(context)
                    .textTheme
                    .body1
                    .apply(
                  color: black,
                ),
              ),
              sizeBox(5.0),
              Text(
                "We're here for your dreams",
                style: Theme
                    .of(context)
                    .textTheme
                    .body2
                    .apply(color: gray),
              ),
              sizeBox(15.0),
              StreamBuilder(
                stream: bloc.name,
                builder: (context, snapshote) =>
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      focusNode: _fNameFocus,
                      onChanged: bloc.changeName,
                      textCapitalization:
                      TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (value) {
                        _fNameFocus.unfocus();
                        FocusScope.of(context)
                            .requestFocus(_emailFocus);
                      },
                      decoration: inPutDecoration(
                          fullName, snapshote.error),
                    ),
              ),
              sizeBox(10.0),
              fieldEmail(),
              sizeBox(10.0),
              fieldPassword(),
              sizeBox(30.0),
              loginButton(),
              sizeBox(25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have account ?',
                    style: Theme
                        .of(context)
                        .textTheme
                        .body2
                        .apply(color: black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => LoginScreen()));
                    },
                    child: Text(
                      loginHere,
                      style: Theme
                          .of(context)
                          .textTheme
                          .body2
                          .apply(color: blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  inPutDecoration(String types, Object error) {
    return InputDecoration(
      hintText: types,
      labelText: types,
      fillColor: black,
      errorText: error,
    );
  }

  Widget fieldEmail() =>
      StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snapshote) =>
            TextField(
              controller: _emailController,
              onChanged: bloc.changeEmail,
              focusNode: _emailFocus,
              onSubmitted: (value) {
                _emailFocus.unfocus();
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: inPutDecoration(email, snapshote.error),
            ),
      );

  Widget fieldPassword() =>
      StreamBuilder<String>(
        stream: bloc.password,
        builder: (context, snapshote) =>
            TextField(
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

  Widget loginButton() =>
      StreamBuilder<bool>(
        stream: bloc.registerSubmitValid,
        builder: (context, snapshot) =>
            RaisedGradientButton(
                child: Text(
                  'Register',
                  style: Theme
                      .of(context)
                      .textTheme
                      .body2
                      .apply(color: white),
                ),
                gradient: LinearGradient(
                    colors: <Color>[blue, blue, lightBlue]),
                isEnable: snapshot.hasData && snapshot.data,
                onPressed: () =>
                    bloc.validAndSubMitOf(
                        FormType.register,
                        _emailController.text,
                        _passwordController.text,
                        _nameController.text,
                        context)),
      );
}
