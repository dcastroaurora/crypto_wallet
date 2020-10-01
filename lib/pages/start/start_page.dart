import 'package:crypto_wallet_fbloc/pages/sign_in/sign_in_page.dart';
import 'package:crypto_wallet_fbloc/pages/sign_up/sign_up_page.dart';
import 'package:crypto_wallet_fbloc/utils/size_config.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff347af0),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 120.0, bottom: 40.0),
          child: Column(
            children: <Widget>[
              // SizedBox(height: getProportionateScreenHeight(120.0)),
              Image.asset('assets/images/logo.png'),
              SizedBox(height: getProportionateScreenHeight(30.0)),
              Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white.withOpacity(0.56),
                ),
              ),
              Text(
                'WHOLLET',
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignUpPage()),
                  );
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Color(0xff347af0),
                  ),
                ),
                child: Container(
                  width: 160,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xff347af0),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dont\'t have an account? ',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => SignInPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
