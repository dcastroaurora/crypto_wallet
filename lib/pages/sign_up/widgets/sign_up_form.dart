import 'package:crypto_wallet_fbloc/pages/sign_in/sign_in_page.dart';
import 'package:crypto_wallet_fbloc/utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  FocusNode _focusNodeFirstName;
  FocusNode _focusNodeLastName;
  FocusNode _focusNodeEmail;
  FocusNode _focusNodePassword;
  Color _colorFirstName;
  Color _colorLastName;
  Color _colorEmail;
  Color _colorPassword;
  TapGestureRecognizer _recognizerSignIp;

  @override
  void initState() {
    _focusNodeFirstName = FocusNode();
    _focusNodeLastName = FocusNode();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();
    _colorFirstName = Color(0xff3d4c63);
    _colorLastName = Color(0xff3d4c63);
    _colorEmail = Color(0xff3d4c63);
    _colorPassword = Color(0xff3d4c63);
    _recognizerSignIp = TapGestureRecognizer();

    _focusNodeFirstName.addListener(() {
      setState(() {
        _colorFirstName = _focusNodeFirstName.hasFocus
            ? Color(0xffb5bbc9)
            : Color(0xff3d4c63);
      });
    });
    _focusNodeLastName.addListener(() {
      setState(() {
        _colorLastName =
            _focusNodeLastName.hasFocus ? Color(0xffb5bbc9) : Color(0xff3d4c63);
      });
    });
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
    _recognizerSignIp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                focusNode: _focusNodeFirstName,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email, color: Color(0xffb5bbc9)),
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    color: _colorFirstName,
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
                autocorrect: false,
                autofocus: false,
              ),
              SizedBox(height: getProportionateScreenHeight(5.0)),
              TextFormField(
                focusNode: _focusNodeLastName,
                decoration: InputDecoration(
                  suffixIcon:
                      Icon(Icons.remove_red_eye, color: Color(0xffb5bbc9)),
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    color: _colorLastName,
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
                autocorrect: false,
                autofocus: false,
              ),
              SizedBox(height: getProportionateScreenHeight(5.0)),
              TextFormField(
                focusNode: _focusNodeEmail,
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
                autocorrect: false,
                autofocus: false,
              ),
              SizedBox(height: getProportionateScreenHeight(5.0)),
              TextFormField(
                focusNode: _focusNodePassword,
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
                autocorrect: false,
                autofocus: false,
              ),
              Spacer(),
              SizedBox(height: getProportionateScreenHeight(5.0)),
              FlatButton(
                color: Color(0xff347af0),
                onPressed: () {},
                child: Container(
                  width: 200.0,
                  height: 46.0,
                  alignment: Alignment.center,
                  child: Text(
                    'Let\'s Get Started',
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
                  text: 'Already have an account?',
                  style: TextStyle(
                    color: Color(0xff485068),
                    fontSize: 15.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' Login',
                      style: TextStyle(
                          color: Color(0xff347af0),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      recognizer: _recognizerSignIp
                        ..onTap = () {
                          Navigator.pop(context);
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
  }

  // _fieldFocusChange(BuildContext context, FocusNode currentFocus) {
  //   setState(() {
  //     currentFocus.unfocus();
  //   });
  //   // FocusScope.of(context).requestFocus(nextFocus);
  // }

  // _requestFocus(BuildContext context, FocusNode currentFocus) {
  //   setState(() {
  //     FocusScope.of(context).requestFocus(currentFocus);
  //   });
  // }
}
