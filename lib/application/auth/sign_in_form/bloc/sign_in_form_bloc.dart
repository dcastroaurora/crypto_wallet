import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(SignInFormState initialState) : super(initialState);

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    throw UnimplementedError();
  }
}
