import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:travel_ui2/pages/shared_widgets/profile_photo.dart';
import 'package:travel_ui2/pages/shared_widgets/tripple_photo.dart';
import '../../models/trip.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final trip = ModalRoute.of(context)!.settings.arguments as Trip;
    final TextStyle? _customeStyle = Theme.of(context).textTheme.subtitle2;

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

            //CONTAINER THAT HOLDS BOTTOM SHEET LIKE SHAPE
            child: Container(
              decoration: roundedTopBorders(),
              width: double.infinity,
              height: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ProfilePhoto(
                            profilePhotoUrl: trip.user.profilePhotoUrl),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(trip.user.firstName,
                            style: _customeStyle!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Text('13 April'),
                      ],
                    ),
                    const Text(
                        "Sont lors repeché des l'aube l'éveil rousseurs qu'un en la revé, de punaises mer vers aux comme désire. Noirs presque."),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next Trip',
                          style: _customeStyle.copyWith(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                        ),
                        const Icon(
                          Icons.car_repair,
                          color: Colors.black,
                        ),
                        Text(
                          'Bali',
                          style: _customeStyle,
                        ),
                        Text(
                          '***',
                          style: _customeStyle,
                        ),
                        Text(
                          'Combodia',
                          style: _customeStyle,
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                    // TripplePhoto(joinedUsers: trip.peopleJoined)

                    //PHOTO OF PEOPLE JOINED
                    Padding(
                      padding: EdgeInsets.only(
                        left: trip.peopleJoined.length > 2 ? 30 : 10,
                      ),
                      child: TripplePhoto(joinedUsers: trip.peopleJoined),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    //ICONS IN BOTTOM
                    Row(
                      children: const [
                        Icon(Icons.favorite),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.share),
                        Spacer(),
                        Icon(Icons.bookmark),
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

  BoxDecoration roundedTopBorders() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      color: Colors.white,
    );
  }
}
