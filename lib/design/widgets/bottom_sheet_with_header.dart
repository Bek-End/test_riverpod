import 'package:flutter/material.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';

class BottomSheetWithHeader extends StatelessWidget {
  const BottomSheetWithHeader({
    super.key,
    required this.child,
  });

  static Future<T> show<T>({
    required BuildContext context,
    required Widget child,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BottomSheetWithHeader(child: child),
    );
  }

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 63,
            height: 6,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: size.width,
              maxHeight: size.height * 0.9,
            ),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
