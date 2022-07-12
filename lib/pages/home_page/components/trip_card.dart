import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:travel_ui2/url.dart';
import '../../../models/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  final String tripDetails =
      "On a trip to America, Looking for someone to join me on this epic journey through american";

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      //Contains everything as card
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            offset: Offset(0, 2),
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //profile picture with name , time stamp
              child: Row(
                children: [
                  CircleAvatar(
                    //backgroundColor: Colors.blue,
                    radius: 25,
                    backgroundImage: NetworkImage(trip.user.profilePhotoUrl),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    trip.user.firstName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Spacer(),
                  Text(
                    'Two hours ago',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              //Contains trip photo
              Container(
                height: 300,
                width: screenSize.width * 95,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: ShowTripImage(
                  networkImgUrl: trip.tripImageUrl,
                ),
              ),
              //TRIP DURATION
              Positioned(
                top: 12,
                left: 12,
                child: Row(
                  children: [
                    TripDurationContainer(
                      tripDuration: trip.tripDuration.toString(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "days trip",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: PeopleJoined(),
              ),

              Positioned(
                bottom: 20,
                right: 20,
                child: Text(
                  'On Trip',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.amber),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  trip.destination,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
              ),
              //JOiN TRIP BUTTON
              const Positioned(
                bottom: -25,
                child: JoinTripButton(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, top: 30.0, right: 8.0, bottom: 12),
            child: Text(trip.tripDescription),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
            color: Colors.black26,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CardIcons(),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

//FETCHES IMAGES FROM NETWOWORK
class CircularIamge extends StatelessWidget {
  String url = "";
  CircularIamge({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: CircularProgressIndicator(),
        ),
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: url,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

//RETURNS JOIN BUTTON
class JoinTripButton extends StatelessWidget {
  const JoinTripButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Text('JOIN'),
      ),
    );
  }
}

//PROVIDES TRIP IMAGE
class ShowTripImage extends StatelessWidget {
  const ShowTripImage({
    Key? key,
    required String networkImgUrl,
  })  : _networkImgUrl = networkImgUrl,
        super(key: key);

  final String _networkImgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(child: CircularProgressIndicator()),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: FadeInImage.memoryNetwork(
            height: 300,
            width: double.infinity,
            placeholder: kTransparentImage,
            image: _networkImgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

//RETURN THREE CIRCLE AVATER IN A STACK
class PeopleJoined extends StatefulWidget {
  PeopleJoined({super.key});

  @override
  State<PeopleJoined> createState() => _TripJoinedWidgetState();
}

class _TripJoinedWidgetState extends State<PeopleJoined> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //back avater
        Positioned(
          left: -36,
          child: MyAvatar(),
        ),
        //middle avater
        Positioned(
          left: -18,
          child: MyAvatar(),
        ),
        //front avater
        MyAvatar()
      ],
    );
  }
}

class MyAvatar extends StatefulWidget {
  MyAvatar({
    super.key,
  });

  @override
  State<MyAvatar> createState() => _MyAvaterState();
}

class _MyAvaterState extends State<MyAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 22,
      child: CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 20,
        backgroundImage: NetworkImage(
          imageURL,
        ),
      ),
    );
  }
}

//RETURNS WHITE LITTLE CONTAINER TO SHOW DIGIT/S
class TripDurationContainer extends StatelessWidget {
  final String tripDuration;
  const TripDurationContainer({super.key, required this.tripDuration});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
          child: Text(
            tripDuration,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

//CONRTAINS FAVORITE, SHARE AND BOOKMARK ICON PLACED AT BOTTOM
class CardIcons extends StatefulWidget {
  const CardIcons({super.key});

  @override
  State<CardIcons> createState() => _CardIconsState();
}

class _CardIconsState extends State<CardIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.favorite),
        SizedBox(
          width: 8,
        ),
        Icon(Icons.share),
        Spacer(),
        Icon(Icons.save)
      ],
    );
  }
}
