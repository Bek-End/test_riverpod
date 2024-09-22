import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';

class CircleIconWidget extends StatelessWidget {
  const CircleIconWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.black,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
