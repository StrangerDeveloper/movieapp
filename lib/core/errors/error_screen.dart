// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';
import 'package:movieapp/core/resources/app_colors.dart';
import 'package:movieapp/core/resources/app_strings.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.onTryAgainPressed,
  }) : super(key: key);

  final Function() onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Image.asset(
              'assets/images/icon.png',
              width: double.infinity,
              height: 150.h,
            ),
          ),
           _errorText(context),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onTryAgainPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              AppStrings.tryAgain,
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _errorText(context) {
     final textTheme = Theme.of(context).textTheme;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.oops,
          style: textTheme.titleMedium,
        ),
        Text(
          AppStrings.errorMessage,
          style: textTheme.bodyLarge,
        ),
        Text(
          AppStrings.tryAgainLater,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
