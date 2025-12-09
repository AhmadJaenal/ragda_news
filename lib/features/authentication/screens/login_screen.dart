import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../core/constans/app_colors.dart';
import '../../../core/constans/app_icon.dart';
import '../../../core/constans/app_images.dart';
import '../../../core/constans/app_margin.dart';
import '../../../core/constans/app_text_style.dart';
import '../../../routing/routes.dart';
import '../../../utils/validator.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'user@gmail.com');
  final _passwordController = TextEditingController(text: '12345678');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(211),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.header),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppImages.header)),
                ),
              ),
              AppTextField(
                label: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                validator: noEmptyEmailValidator,
                prefixIcon: AppIcons.user,
              ),
              AppTextField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                validator: isValidPassword,
                prefixIcon: AppIcons.lock,
                isPassword: true,
              ),
              const Gap(8),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyle.h8Regular.copyWith(
                    color: AppColors.danger,
                  ),
                ),
              ),
              const Gap(24),
              PrimaryButton(
                titleButton: 'Enter',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.offAllNamed(Routes.navbar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
