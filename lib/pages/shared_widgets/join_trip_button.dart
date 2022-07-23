import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).primaryColor, //TODO: FIX FROM THEME
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Text('JOIN'),
      ),
    );
  }
}
