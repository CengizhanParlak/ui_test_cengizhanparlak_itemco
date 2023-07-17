import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';

class NoDataText extends StatelessWidget {
  const NoDataText({
    super.key,
    this.refresh,
  });

  final Function? refresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No Data'),
        const SizedBox(height: Paddings.kPadding12),
        if (refresh != null)
          ElevatedButton(
            onPressed: () => refresh?.call(),
            child: const Text('Refresh'),
          ),
      ],
    );
  }
}
