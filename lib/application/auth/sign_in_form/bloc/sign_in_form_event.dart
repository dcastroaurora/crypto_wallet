part of 'sign_in_form_bloc.dart';

@freezed
@immutable
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String email) = EmailChange;
  const factory SignInFormEvent.passwordChanged(String password) =
      PasswordChange;
  const factory SignInFormEvent.signInWithEmailAndPassword() =
      SignInWithEmailAndPassword;
}
