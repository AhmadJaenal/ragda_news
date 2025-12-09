import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constans/app_colors.dart';
import '../../core/constans/app_text_style.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool isPassword;
  final String prefixIcon;
  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.errorText,
    this.validator,
    this.isPassword = false,
    required this.prefixIcon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscure = false;
  String? _errorText;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Text(
          widget.label,
          style: AppTextStyle.h7Regular.copyWith(
            color: AppColors.primaryTextColor,
          ),
        ),
        const Gap(6),
        Container(
          height: null,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            obscureText: _isObscure,
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.bottom,
            style: AppTextStyle.h7Regular.copyWith(
              color: AppColors.primaryTextColor,
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              prefixIcon: Image.asset(widget.prefixIcon, width: 14, height: 14),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                  : null,
              errorText: widget.errorText ?? _errorText,
              errorStyle: AppTextStyle.h7Regular.copyWith(
                color: AppColors.danger,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryTextColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: widget.hintText,
              hintStyle: AppTextStyle.h7Regular.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            onChanged: (value) {
              final error = widget.validator?.call(widget.controller?.text);
              if (error == null) {
                setState(() {
                  _errorText = null;
                });
              }
            },
            focusNode: _focus,
          ),
        ),
      ],
    );
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      setState(() {
        _errorText = widget.validator?.call(widget.controller?.text);
      });
    }
  }
}

class AppDropdown extends StatefulWidget {
  final List<String> option;
  final ValueChanged<String> onChanged;
  const AppDropdown({super.key, required this.option, required this.onChanged});

  @override
  State<AppDropdown> createState() => AppDropdownState();
}

class AppDropdownState extends State<AppDropdown> {
  String _selectedItem = 'Pilih';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.black100.withAlpha(20),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == 'Pilih') {
            return 'PILIH DATA DENGAN SESUAI';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.black100),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        borderRadius: BorderRadius.circular(8),
        style: AppTextStyle.h8Regular.copyWith(color: AppColors.black500),
        elevation: 0,
        initialValue: _selectedItem,
        onChanged: (String? newValue) {
          setState(() {
            _selectedItem = newValue!;
            widget.onChanged(newValue);
          });
        },
        items: widget.option.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.centerLeft,
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
