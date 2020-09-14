import 'package:crypto_wallet_fbloc/pages/sign_up/sign_up_page.dart';

import 'pages/sign_in/sign_in_page.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
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
      home: SignInPage(),
    );
  }
}
