import 'package:crypto_wallet_fbloc/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:crypto_wallet_fbloc/domain/core/value_validators.dart';
import 'package:crypto_wallet_fbloc/infrastructure/auth/auth_failure_or_success.dart';
import 'package:crypto_wallet_fbloc/pages/sign_up/sign_up_page.dart';
import 'package:crypto_wallet_fbloc/utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  FocusNode _focusNodeFirstName;
  FocusNode _focusNodeLastName;
  FocusNode _focusNodeEmail;
  FocusNode _focusNodePassword;
  Color _colorEmail;
  Color _colorPassword;
  TapGestureRecognizer _recognizerSignUp;

  @override
  void initState() {
    _focusNodeFirstName = FocusNode();
    _focusNodeLastName = FocusNode();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();
    _colorEmail = Color(0xff3d4c63);
    _colorPassword = Color(0xff3d4c63);
    _recognizerSignUp = TapGestureRecognizer();

    _focusNodeEmail.addListener(() {
      setState(() {
        _colorEmail =
            _focusNodeEmail.hasFocus ? Color(0xffb5bbc9) : Color(0xff3d4c63);
      });
    });
    _focusNodePassword.addListener(() {
      setState(() {
        _colorPassword =
            _focusNodePassword.hasFocus ? Color(0xffb5bbc9) : Color(0xff3d4c63);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeFirstName.dispose();
    _focusNodeLastName.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _recognizerSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        if (state.authFailureOrSuccess == AuthFailureOrSuccess.success()) {
          showSnackBar(
            context,
            SnackBar(
              content: Text('Success'),
              backgroundColor: Colors.blue,
            ),
          );
        } else if (state.isSubmitting) {
          showSnackBar(
            context,
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Validating...'),
                  CircularProgressIndicator()
                ],
              ),
              backgroundColor: Colors.blue,
            ),
          );
        } else if (state.authFailureOrSuccess ==
            AuthFailureOrSuccess.emailAlreadyInUse()) {
          showSnackBar(
            context,
            SnackBar(
              content: Text('Email already in use'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state.authFailureOrSuccess ==
            AuthFailureOrSuccess.invalidEmailAndPassword()) {
          showSnackBar(
            context,
            SnackBar(
              content: Text('Invalid email and password'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state.authFailureOrSuccess ==
            AuthFailureOrSuccess.serverError()) {
          showSnackBar(
            context,
            SnackBar(
              content: Text('Server error'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    focusNode: _focusNodeEmail,
                    onChanged: (value) => context.bloc<SignInFormBloc>().add(
                          SignInFormEvent.emailChanged(value),
                        ),
                    validator: (value) =>
                        validateEmailAddress(value) ? null : 'Invalid Email',
                    decoration: InputDecoration(
                      suffixIcon:
                          Icon(Icons.remove_red_eye, color: Color(0xffb5bbc9)),
                      labelText: 'Email address',
                      labelStyle: TextStyle(
                        color: _colorEmail,
                        fontSize: 19.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff347af0),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffcfd2d8)),
                      ),
                    ),
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    autocorrect: false,
                    autofocus: false,
                  ),
                  SizedBox(height: getProportionateScreenHeight(5.0)),
                  TextFormField(
                    focusNode: _focusNodePassword,
                    onChanged: (value) => context.bloc<SignInFormBloc>().add(
                          SignInFormEvent.passwordChanged(value),
                        ),
                    validator: (value) =>
                        validatePassword(value) ? null : 'Invalid Password',
                    decoration: InputDecoration(
                      suffixIcon:
                          Icon(Icons.remove_red_eye, color: Color(0xffb5bbc9)),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: _colorPassword,
                        fontSize: 19.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff347af0),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffcfd2d8)),
                      ),
                    ),
                    obscureText: true,
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    autocorrect: false,
                    autofocus: false,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Color(0xff347af0),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(height: getProportionateScreenHeight(45.0)),
                  FlatButton(
                    color: Color(0xff347af0),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.bloc<SignInFormBloc>().add(
                            SignInFormEvent.signInWithEmailAndPassword(),
                          );
                    },
                    child: Container(
                      width: 200.0,
                      height: 46.0,
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(30.0),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10.0)),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                        color: Color(0xff485068),
                        fontSize: 15.0,
                      ),
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: TextStyle(
                              color: Color(0xff347af0),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                          recognizer: _recognizerSignUp
                            ..onTap = () {
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SignUpPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, Widget snackbar) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
