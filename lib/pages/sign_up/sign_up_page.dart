import 'package:crypto_wallet_fbloc/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffedf1f9),
        title: Text(
          'Create Account',
          style: TextStyle(
            color: Color(0xff0d1f3c),
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: Color(0xffedf1f9),
        child: CustomScrollView(
          reverse: true,
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/office.png'),
                  SignUpForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
