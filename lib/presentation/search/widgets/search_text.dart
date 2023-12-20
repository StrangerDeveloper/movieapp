import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Search",
            style: textTheme.titleMedium,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.v),
            child: Text(
              "Tv shows, Movies and more",
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
