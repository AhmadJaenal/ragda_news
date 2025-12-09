import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../core/constans/app_colors.dart';
import '../../../core/constans/app_icon.dart';
import '../../../core/constans/app_images.dart';
import '../../../core/constans/app_margin.dart';
import '../../../core/constans/app_text_style.dart';
import '../../widgets/app_button.dart';
import '../../widgets/tile_menu_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(190),
          child: Container(
            padding: EdgeInsets.all(AppMargin.defaultMargin),
            color: AppColors.primary,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: AppColors.white),
                    ),
                    const Gap(16),
                    Text(
                      'Profile',
                      style: AppTextStyle.h5SemiBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(AppImages.avatar, fit: BoxFit.cover),
                    ),
                    const Gap(16),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyle.h3SemiBold.copyWith(
                          color: AppColors.white,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Hasan Waulat\n'),
                          TextSpan(
                            text: 'Departemen A',
                            style: AppTextStyle.h8Regular.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: AppMargin.defaultMargin,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: ListView(
            children: [
              Text(
                'Account Settings',
                style: AppTextStyle.h7Regular.copyWith(
                  color: AppColors.black400,
                ),
              ),
              const Gap(16),
              tileMenuProfile(
                label: 'Password & Security',
                icon: AppIcons.lock,
                onTap: () {},
              ),
              const Gap(8),
              tileMenuProfile(
                label: 'Salary Slip Summary',
                icon: AppIcons.price,
                onTap: () {},
              ),
              const Gap(8),
              tileMenuProfile(
                label: 'Leave Summary',
                icon: AppIcons.calendar,
                onTap: () {},
              ),
              const Gap(8),
              tileMenuProfile(
                label: 'Overtime Summary',
                icon: AppIcons.time,
                onTap: () {},
              ),
              const Gap(8),
              tileMenuProfile(
                label: 'Annual Tax Return PPH21',
                icon: AppIcons.report,
                onTap: () {},
              ),
              const Gap(16),
              Text(
                'Other',
                style: AppTextStyle.h7Regular.copyWith(
                  color: AppColors.black400,
                ),
              ),
              const Gap(16),
              tileMenuProfile(
                label: 'Logout',
                icon: AppIcons.logout,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: AppColors.white,
                        content: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(12),
                              Image.asset(
                                AppImages.logout,
                                width: 120,
                                height: 120,
                              ),
                              const Gap(32),
                              Text(
                                'Logout?',
                                style: AppTextStyle.h3Bold.copyWith(
                                  color: AppColors.black400,
                                ),
                              ),
                              const Gap(8),
                              Text(
                                'Are you sure you want to logout?',
                                style: AppTextStyle.h6Regular.copyWith(
                                  color: AppColors.black300,
                                ),
                              ),
                              const Gap(32),
                            ],
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style: AppTextStyle.h7SemiBold.copyWith(
                                        color: AppColors.danger,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: PrimaryButton(
                                  titleButton: 'Logout',
                                  onPressed: () {},
                                  isDanger: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
