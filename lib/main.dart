import 'package:flutter/material.dart';
import 'package:travel_ui2/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel UI',
        theme: ThemeData(
          primaryColor: Colors.amber,
          textTheme: const TextTheme(
            headline6:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(
            color: Colors.blueGrey,
          ),
        ),
        // home: const HomePage(),
        home: const HomePage());
  }
}
