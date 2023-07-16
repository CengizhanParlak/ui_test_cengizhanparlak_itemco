import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/colors.dart';

class NoImageContainer extends StatelessWidget {
  const NoImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColors.gray,
      ),
      child: const Icon(Icons.error, color: AppColors.white),
    );
  }
}
