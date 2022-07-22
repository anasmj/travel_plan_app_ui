import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
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
      decoration: getContainerDecoration(),
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
                  const TimeStamp(),
                ],
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              //Contains trip photo
              getTripPhoto(screenSize),
              //TRIP DURATION
              Positioned(
                top: 12,
                left: 12,
                child: getTripDurationText(context, trip.tripDuration),
              ),

              Positioned(
                top: 12,
                right: 12,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    if (trip.peopleJoined.length == 1)
                      SingleAvatar(
                          imageUrl: trip.peopleJoined[0].profilePhotoUrl),
                    if (trip.peopleJoined.length == 2) getProfilePhotoForTwo(),
                    if (trip.peopleJoined.length > 2)
                      getMoreThanTwoProfilePhoto(),
                  ],
                ),
              ),

              Positioned(
                bottom: 20,
                right: 20,
                child: onTripText(context),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: destinationText(context),
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

  Text destinationText(BuildContext context) {
    return Text(
      trip.destination,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
    );
  }

  Text onTripText(BuildContext context) {
    return Text(
      'On Trip',
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.amber),
    );
  }

  Stack getMoreThanTwoProfilePhoto() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //middle image
        Positioned(
          left: -36,
          child: SingleAvatar(
            imageUrl: trip.peopleJoined[2].profilePhotoUrl,
          ),
        ),
        Positioned(
          left: -18,
          child: SingleAvatar(
            imageUrl: trip.peopleJoined[1].profilePhotoUrl,
          ),
        ),

        //front image
        SingleAvatar(
          numOfPeopleJoined: trip.peopleJoined.length,
        ),
      ],
    );
  }

  Stack getProfilePhotoForTwo() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //backward image
        Positioned(
          left: -18,
          child: SingleAvatar(
            imageUrl: trip.peopleJoined[1].profilePhotoUrl,
          ),
        ),
        //front image
        SingleAvatar(
          imageUrl: trip.peopleJoined[0].profilePhotoUrl,
        ),
      ],
    );
  }

  Row getTripDurationText(BuildContext context, int tripDuration) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
              child: Text(
                tripDuration.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ),
          ),
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
    );
  }

  //PHOTO OF A TRIP IN DECORATED CONTAINER
  Container getTripPhoto(Size screenSize) {
    return Container(
      height: 300,
      width: screenSize.width * 95,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          const Center(child: CircularProgressIndicator()),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: FadeInImage.memoryNetwork(
              height: 300,
              width: double.infinity,
              placeholder: kTransparentImage,
              image: trip.tripImageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  //DECORATION OF MAIN CONTAINER
  BoxDecoration getContainerDecoration() {
    return const BoxDecoration(
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
    );
  }
}

// TIME STAMP OF A POST
class TimeStamp extends StatelessWidget {
  const TimeStamp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Two hours ago',
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
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
      onPressed: () {
        print('join pressed');
      },
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

//RETURNS AN AVATAR WITH IMAGE OR INTEGER
class SingleAvatar extends StatefulWidget {
  SingleAvatar({super.key, this.imageUrl, this.numOfPeopleJoined});

  String? imageUrl;
  int? numOfPeopleJoined;

  @override
  State<SingleAvatar> createState() => _MyAvaterState();
}

class _MyAvaterState extends State<SingleAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // border
      backgroundColor: Colors.white,
      radius: 22,
      child: widget.numOfPeopleJoined !=
              null //RETURNS NUMBER OR PROFILE PICTURE DEPENDING ON PROVIDED VALUE
          ? getNoOfPeopleJoined()
          : getProfilePicture(),
    );
  }

  //RETURNS A NUMBER IN A CIRCLE AVATAR
  CircleAvatar getNoOfPeopleJoined() {
    return CircleAvatar(
      //main circle avater
      radius: 20,
      child: widget.numOfPeopleJoined != null
          ? Text(
              '+${(widget.numOfPeopleJoined! - 2).toString()}',
              style: const TextStyle(color: Colors.black),
            )
          : const Text(''),
    );
  }

  //RETURNS PROFILE PICTURE
  CircleAvatar getProfilePicture() {
    return CircleAvatar(
      //main circle avater
      backgroundColor: Colors.grey,
      radius: 20,
      backgroundImage: NetworkImage(
        widget.imageUrl!,
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
