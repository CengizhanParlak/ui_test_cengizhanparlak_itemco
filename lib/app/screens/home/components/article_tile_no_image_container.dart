import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/colors.dart';

class NoImageContainer extends StatelessWidget {
  const NoImageContainer({
    this.height = 48,
    this.width = 48,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColors.gray,
      ),
      child: const Icon(Icons.error, color: AppColors.white),
    );
  }
}
