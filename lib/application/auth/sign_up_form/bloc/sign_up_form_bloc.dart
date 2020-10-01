import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet_fbloc/domain/auth/i_auth_facade.dart';
import 'package:crypto_wallet_fbloc/domain/core/value_validators.dart';
import 'package:crypto_wallet_fbloc/infrastructure/auth/auth_failure_or_success.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';
part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;
  SignUpFormBloc(@Named("impl1") this._authFacade)
      : super(SignUpFormState.initial());

  @override
  Stream<SignUpFormState> mapEventToState(
    SignUpFormEvent event,
  ) async* {
    Stream<SignUpFormState> _mapEmailChangedToState(String email) async* {
      yield state.copyWith(
        emailAddress: email,
        authFailureOrSuccess: AuthFailureOrSuccess.none(),
      );
    }

    Stream<SignUpFormState> _mapPasswordChangedToState(String password) async* {
      yield state.copyWith(
        password: password,
        authFailureOrSuccess: AuthFailureOrSuccess.none(),
      );
    }

    Stream<SignUpFormState> _mapRegisterWithEmailAndPassword() async* {
      final String email = state.emailAddress;
      final String password = state.password;

      if (validateEmailAddress(email) && validatePassword(password)) {
        yield state.copyWith(
          showErrorMessages: false,
          isSubmitting: true,
          authFailureOrSuccess: AuthFailureOrSuccess.none(),
        );

        var result = await _authFacade.registerWithEmailAndPassword(
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
    }

    yield* event.map(
      emailChanged: (event) => _mapEmailChangedToState(event.email),
      passwordChanged: (event) => _mapPasswordChangedToState(event.password),
      registerWithEmailAndPassword: (_) => _mapRegisterWithEmailAndPassword(),
    );
  }
}
