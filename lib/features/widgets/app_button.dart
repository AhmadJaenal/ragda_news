import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ragda_news/core/constans/app_colors.dart';
import 'package:ragda_news/core/constans/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final String titleButton;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDanger;

  const PrimaryButton({
    super.key,
    required this.titleButton,
    required this.onPressed,
    this.isLoading = false,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDanger ? AppColors.danger : AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.black100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, anim) =>
              FadeTransition(opacity: anim, child: child),
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loader'),
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  titleButton,
                  key: const ValueKey('text'),
                  style: AppTextStyle.h7SemiBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
