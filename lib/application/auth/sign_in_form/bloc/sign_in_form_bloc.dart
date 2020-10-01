import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet_fbloc/domain/auth/i_auth_facade.dart';
import 'package:crypto_wallet_fbloc/domain/core/value_validators.dart';
import 'package:crypto_wallet_fbloc/infrastructure/auth/auth_failure_or_success.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(@Named("impl1") this._authFacade)
      : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (event) async* {
        yield state.copyWith(
          emailAddress: event.email,
        );
      },
      passwordChanged: (event) async* {
        yield state.copyWith(
          password: event.password,
        );
      },
      signInWithEmailAndPassword: (event) async* {
        final String email = state.emailAddress;
        final String password = state.password;

        if (validateEmailAddress(email) && validatePassword(password)) {
          yield state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            authFailureOrSuccess: AuthFailureOrSuccess.none(),
          );

          var result = await _authFacade.signInWithEmailAndPassword(
              emailAddress: email, password: password);

          yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: result.authFailureOrSuccess,
          );
        } else {
          yield state.copyWith(
            showErrorMessages: true,
            authFailureOrSuccess: AuthFailureOrSuccess.none(),
          );
        }
      },
    );
  }
}
