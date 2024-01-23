import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel/config/routes/routes.dart';
import 'package:hotel/core/design/theme.dart';
import 'package:hotel/injector.dart';

import 'presentation/pages/home/MyHomePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeGetIt();
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
  );
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeGetIt();
//
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Бронирование номера',
      theme: myAppTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: const MyHomePage(),
    );
  }
}
