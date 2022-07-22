import 'package:flutter/material.dart';
import 'package:travel_ui2/pages/home_page/home_page.dart';
import 'package:travel_ui2/pages/trip_details_page.dart/page_details.dart';

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
        primarySwatch: Colors.amber, // circle avatar
        textTheme: const TextTheme(
          headline6:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey.shade600,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/trip_details': (context) => const TripDetails()
      },
    );
  }
}
