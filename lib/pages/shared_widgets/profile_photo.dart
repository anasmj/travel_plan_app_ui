import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key? key,
    required this.profilePhotoUrl,
  }) : super(key: key);

  final String profilePhotoUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      //backgroundColor: Colors.blue,
      radius: 25,
      backgroundImage: NetworkImage(profilePhotoUrl),
    );
  }
}
