import 'package:flutter/material.dart';
import 'package:travel_ui2/pages/home_page/components/search_box.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    //TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Traveling to ?",
              style: textTheme.headline6,
            ),
            const Icon(
              Icons.search,
              color: Colors.black,
              //TODO: manage icon color from theme
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SearcBox(),
        ),
      ],
    );
  }
}
