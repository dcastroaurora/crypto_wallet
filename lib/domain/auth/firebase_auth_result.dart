import 'package:crypto_wallet_fbloc/infrastructure/auth/auth_failure_or_success.dart';

class FirebaseAuthResult {
  final bool isSuccess;
  final AuthFailureOrSuccess authFailureOrSuccess;

  FirebaseAuthResult({this.authFailureOrSuccess, this.isSuccess});
}
