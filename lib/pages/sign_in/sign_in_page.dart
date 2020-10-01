import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import '../../injection.dart';
import 'package:flutter/material.dart';
import 'widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffedf1f9),
        title: Text(
          'Welcome Back!',
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
                  Image.asset('assets/images/login.png'),
                  BlocProvider(
                    // create: (context) => SignInFormBloc(
                    //     FirebaseAuthFacade(FirebaseAuth.instance)),
                    create: (_) => getIt<SignInFormBloc>(),
                    child: SignInForm(),
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
