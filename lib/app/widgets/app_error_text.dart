import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, this.text, this.refresh});

  final String? text;
  final Function? refresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text ?? 'Something went wrong!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Paddings.kPadding12),
        if (refresh != null)
          ElevatedButton(
            onPressed: () => refresh?.call(),
            child: const Text('Refresh'),
          )
      ],
    );
  }
}
