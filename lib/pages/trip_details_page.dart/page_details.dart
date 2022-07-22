import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../models/trip.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final trip = ModalRoute.of(context)!.settings.arguments as Trip;
    return Scaffold(
      body: Stack(
        children: [
          //const CircularProgressIndicator(),
          FadeInImage.memoryNetwork(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            placeholder: kTransparentImage,
            image: trip.tripImageUrl,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 20,
                        ),
                        Text('sia'),
                        Spacer(),
                        Text('13 April'),
                      ],
                    ),
                    Text(
                        "Sont lors repeché des l'aube l'éveil rousseurs qu'un en la revé, de punaises mer vers aux comme désire. Noirs presque."),
                    Row(
                      children: [
                        Text('Next Trip'),
                        Icon(Icons.car_repair),
                        Text('Bali'),
                        Text('***'),
                        Text('Combodia'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
