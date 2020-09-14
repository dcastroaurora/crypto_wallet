part of 'sign_in_form_bloc.dart';

@freezed
@immutable
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required String emailAddress,
    @required String password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    // @required AuthFailureOrSuccess authFailureOrSuccess,
  }) = _SignInFormState;
}

// class SignInFormInitial extends SignInFormState {}
