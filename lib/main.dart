import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:promt_app/Screens/choose_screen.dart';
import 'package:promt_app/Screens/coin_screen.dart';
import 'package:promt_app/Screens/main_screen.dart';

import 'Screens/random_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''), // arabic, no country code
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/randomScreen': (context) => const RandomScreen(),
        '/coinScreen': (context) => const CoinScreen(),
        '/chooseScreen': (context) => ChooseScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

