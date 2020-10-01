import 'package:crypto_wallet_fbloc/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false)
void configureDependencies() => $initGetIt(getIt);
