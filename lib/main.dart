import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:ordering_system/ViewModel/app_services.dart';
import 'package:ordering_system/ViewModel/items/iterms_services.dart';
import 'package:ordering_system/ViewModel/users_services.dart';
import 'Presentation/View/home.dart';
import 'package:provider/provider.dart';

void main() {
  Paint.enableDithering = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => AppServices(),
            ),
            ChangeNotifierProvider(
              create: (context) => UsersServices(),
            ),
            ChangeNotifierProvider(
              create: (context) => ItemServices(),
            )
          ],
          child: MaterialApp(
            theme: ThemeData(fontFamily: 'PTSerif'),
            debugShowCheckedModeBanner: false,
            home: const Home(),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
