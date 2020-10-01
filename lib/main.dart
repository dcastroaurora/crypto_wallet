import 'package:crypto_wallet_fbloc/injection.dart';
import 'package:crypto_wallet_fbloc/pages/start/start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/simple_observer_bloc.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  configureDependencies();
  runApp(MyApp());
}
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(),
//       ),
//     );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: StartPage(),
    );
  }
}
