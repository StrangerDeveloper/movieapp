import 'package:flutter/material.dart';

class NoResult extends StatelessWidget {
  const NoResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Center(
        child: Text(
          "No Result Found",
          style: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
