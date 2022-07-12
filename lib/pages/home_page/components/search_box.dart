import 'package:flutter/material.dart';

class SearcBox extends StatelessWidget {
  final double _defaultBorderRadius = 6;
  final Color _cursorColor = Colors.black;
  final Color _shadowColor = Colors.grey.shade400;
  final double _cursorHeight = 22;
  //TODO: find where horizontal spacing is coming from

  SearcBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? searhBoxTextStyle = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(color: Colors.grey.shade600);

    return Material(
      elevation: 3,
      //color: Colors.amber,
      shadowColor: _shadowColor,
      borderRadius: BorderRadius.circular(_defaultBorderRadius),
      child: TextField(
        cursorColor: _cursorColor,
        cursorHeight: _cursorHeight,
        decoration: InputDecoration(
          hintText: "Enter name of city you're traveling to",
          hintStyle: searhBoxTextStyle,
          border: _roundBOrder(),
          focusedBorder: _roundBOrder(),
          contentPadding: const EdgeInsets.only(left: 20),
        ),
      ),
    );
  }

  OutlineInputBorder _roundBOrder() => OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_defaultBorderRadius),
        ),
        borderSide: BorderSide.none,
      );
}
