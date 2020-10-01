import 'package:crypto_wallet_fbloc/application/auth/sign_up_form/bloc/sign_up_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';
import 'widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  BlocProvider(
                    create: (_) => getIt<SignUpFormBloc>(),
                    child: SignUpForm(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
