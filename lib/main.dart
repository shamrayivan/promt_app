import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promt_app/Screens/coin_screen.dart';
import 'package:promt_app/Screens/main_screen.dart';
import 'package:promt_app/random_bloc/random_bloc.dart';

import 'Screens/random_screen.dart';

void main() {
  runApp(const MyApp());
}

Future<String> getData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "I am data";
    // throw Exception("Custom Error");
  });
}

DateTime initTime = DateTime(1998, 10, 23, 05, 45);
// DateTime nowTime = DateTime.now();
String answer = "";
int random = 2;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/randomScreen': (context) => const RandomScreen(),
        '/coinScreen': (context) => const CoinScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Советчик'),
    );
  }
}

