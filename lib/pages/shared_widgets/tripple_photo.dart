import 'package:flutter/material.dart';
import '../../models/user.dart';

class TripplePhoto extends StatelessWidget {
  TripplePhoto({super.key, required this.joinedUsers});

  List<User> joinedUsers;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (joinedUsers.length == 1)
          SingleAvatar(imageUrl: joinedUsers[0].profilePhotoUrl),
        if (joinedUsers.length == 2) getDpForTwo(joinedUsers),
        if (joinedUsers.length > 2) getDpForMoreThanTwo(joinedUsers),
      ],
    );
  }
}

///For more than two user it returns two profile picture and nunber of joined user
Stack getDpForMoreThanTwo(List<User> userList) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      //middle image
      Positioned(
        left: -36,
        child: SingleAvatar(
          imageUrl: userList[2].profilePhotoUrl,
        ),
      ),
      Positioned(
        left: -18,
        child: SingleAvatar(
          imageUrl: userList[1].profilePhotoUrl,
        ),
      ),

      //front image
      SingleAvatar(
        numOfPeopleJoined: userList.length,
      ),
    ],
  );
}

Stack getDpForTwo(List<User> userList) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      //backward image
      Positioned(
        left: -18,
        child: SingleAvatar(
          imageUrl: userList[1].profilePhotoUrl,
        ),
      ),
      //front image
      SingleAvatar(
        imageUrl: userList[0].profilePhotoUrl,
      ),
    ],
  );
}

//RETURNS NUMBER OR PROFILE PHO0TO depending on
// on which purpose its being called
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
      //backgroundColor: Colors.grey,
      radius: 20,
      backgroundImage: NetworkImage(
        widget.imageUrl!,
      ),
    );
  }
}
