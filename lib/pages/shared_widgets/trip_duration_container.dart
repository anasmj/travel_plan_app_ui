import 'package:flutter/material.dart';

//RETURNS WHITE LITTLE CONTAINER TO SHOW DIGIT/S
class TripDurationContainer extends StatelessWidget {
  final int tripDuration;
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
            tripDuration.toString(),
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
