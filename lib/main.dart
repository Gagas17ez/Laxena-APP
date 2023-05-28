import 'package:flutter/material.dart';
import 'package:Laxena/web_laxena_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1))
      .then((value) => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laxena',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const WebLaxenaPage(),
    );
  }
}
