import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text ?? 'Something went wrong!',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
