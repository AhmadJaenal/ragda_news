import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ragda_news/core/constans/app_colors.dart';
import 'package:ragda_news/core/constans/app_icon.dart';
import 'package:ragda_news/core/constans/app_text_style.dart';

GestureDetector tileMenuProfile({
  required String label,
  required VoidCallback onTap,
  required String icon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      child: Row(
        children: [
          Image.asset(icon, color: AppColors.black500),
          const Gap(12),
          Text(
            label,
            style: AppTextStyle.h7Regular.copyWith(
              color: AppColors.primaryTextColor,
            ),
          ),
          const Spacer(),
          Image.asset(AppIcons.arrowRight, color: AppColors.black500),
        ],
      ),
    ),
  );
}
