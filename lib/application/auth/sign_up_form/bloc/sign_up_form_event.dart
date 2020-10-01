part of 'sign_up_form_bloc.dart';

@freezed
abstract class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.emailChanged(String email) = EmailChange;
  const factory SignUpFormEvent.passwordChanged(String password) =
      PasswordChange;
  const factory SignUpFormEvent.registerWithEmailAndPassword() =
      RegisterWithEmailAndPassword;
}
