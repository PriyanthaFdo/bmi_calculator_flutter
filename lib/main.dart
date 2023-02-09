import 'views/results_page.dart';
import 'package:flutter/material.dart';
import 'views/input_file.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121321),
        ),
        scaffoldBackgroundColor: const Color(0xFF121321),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
        '/results': (context) => const ResultsPage(),
      },
    );
  }
}
