import 'package:travel_ui2/models/user.dart';
import 'package:travel_ui2/url.dart';

class Trip {
  User user;
  String destination;
  String tripDescription;
  String tripImageUrl;
  String joinedProfileImageUrl1;
  String joinedProfileImageUrl2;

  int tripDuration;
  //int numOfPeopleJoined;

  List<User> peopleJoined;

  Trip(
      {required this.user,
      required this.destination,
      required this.tripDuration,
      this.tripImageUrl = "",
      this.joinedProfileImageUrl1 = "",
      this.joinedProfileImageUrl2 = "",
      this.tripDescription = "",
      //this.numOfPeopleJoined = 0,
      required this.peopleJoined});
}

List<Trip> listOfTrips = [
  Trip(
      user: User(firstName: "Jennifer", profilePhotoUrl: jennifer),
      destination: "Venis",
      tripDuration: 3,
      tripImageUrl: venis,
      joinedProfileImageUrl1: andrew,
      joinedProfileImageUrl2: diana,
      tripDescription:
          "Sed et magna voluptua sanctus kasd. Diam invidunt tempor et eirmod consetetur amet ipsum, takimata ipsum sadipscing est ea takimata",
      //numOfPeopleJoined: 5,
      peopleJoined: []),
  Trip(
    user: User(firstName: "Diana", profilePhotoUrl: diana),
    destination: "Luxembourg",
    tripDuration: 5,
    tripImageUrl: lux,
    joinedProfileImageUrl1: andrew,
    joinedProfileImageUrl2: josef,
    //numOfPeopleJoined: 3,
    peopleJoined: [
      User(firstName: 'Vincent', profilePhotoUrl: vincent),
    ],
  ),
  Trip(
      user: User(firstName: "Vincent", profilePhotoUrl: vincent),
      destination: "Shanghai",
      tripDuration: 3,
      tripImageUrl: shanghai,
      joinedProfileImageUrl1: jennifer,
      joinedProfileImageUrl2: andrew,
      tripDescription:
          "Demain d'une ô qui l'art qu'un qui, dans mais face qu'elle sa gaze soucieux, la et mignard quel beauté voici le fait cette hélas. L'abri et trésor face pauvre long,.",
      //numOfPeopleJoined: 8,
      peopleJoined: [
        User(firstName: 'Jennifer', profilePhotoUrl: jennifer),
        User(firstName: 'Vincent', profilePhotoUrl: vincent),
      ]),
  Trip(
      user: User(firstName: "Nora", profilePhotoUrl: nora),
      destination: "Dhaka",
      tripDuration: 7,
      tripImageUrl: dhaka,
      joinedProfileImageUrl1: andrew,
      joinedProfileImageUrl2: diana,
      tripDescription:
          "Thez vylag kynaal egyre vh iumhumnok, scegegkel fuhazatum ezes wklelue.",
      //numOfPeopleJoined: 10,
      peopleJoined: [
        User(firstName: 'Jennifer', profilePhotoUrl: jennifer),
        User(firstName: 'Diana', profilePhotoUrl: diana),
        User(firstName: 'Jennifer', profilePhotoUrl: jennifer),
        User(firstName: 'Josef', profilePhotoUrl: josef),
      ]),
];
