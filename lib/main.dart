import './screen/login.dart';
import 'package:flutter/material.dart';
import './screen//register.dart';
import './screen/app_main_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/main",
      routes: {
        //"/": (context) => const MyFullPage(),
        //"/myhomepage": (context) => MyHomePage(title: ""),
        "/login": (context) => Login(),
        "/register": (context) => const Register(),
        "/main": (context) => const AppMainScreen(),
      },
    );
  }
}
