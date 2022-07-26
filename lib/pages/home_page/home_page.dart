import 'package:flutter/material.dart';
import 'package:travel_ui2/pages/config.dart';
import '../shared_widgets/bottom_navigation_bar.dart';
import 'components/custom_appbar.dart';
import 'package:travel_ui2/models/trip.dart';
import 'components/trip_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: false,
      appBar: AppBar(
        toolbarHeight: 120,
        title: const CustomAppBar(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
        child: ListView.builder(
          itemCount: listOfTrips.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/trip_details',
                arguments: listOfTrips[index],
              ), //TODO: send index number to use as tag for HERO widget
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TripCard(trip: listOfTrips[index]),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
