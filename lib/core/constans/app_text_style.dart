import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle h1Bold = GoogleFonts.inter().copyWith(
    fontSize: 32.sp,
    letterSpacing: -(32 * 0.02),
    height: 40 / 32,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h1SemiBold = GoogleFonts.inter().copyWith(
    fontSize: 32.sp,
    letterSpacing: -(32 * 0.02),
    height: 40 / 32,
    fontWeight: AppWeightFont.semiBold,
  );

  static TextStyle h1Regular = GoogleFonts.inter().copyWith(
    fontSize: 32.sp,
    letterSpacing: -(32 * 0.02),
    height: 40 / 32,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle h2Bold = GoogleFonts.inter().copyWith(
    fontSize: 28.sp,
    letterSpacing: -(28 * 0.02),
    height: 36 / 28,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h2SemiBold = GoogleFonts.inter().copyWith(
    fontSize: 28.sp,
    letterSpacing: -(28 * 0.02),
    height: 36 / 28,
    fontWeight: AppWeightFont.semiBold,
  );

  static TextStyle h2Regular = GoogleFonts.inter().copyWith(
    fontSize: 28.sp,
    letterSpacing: -(28 * 0.02),
    height: 36 / 28,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle h3Bold = GoogleFonts.inter().copyWith(
    fontSize: 24.sp,
    letterSpacing: -(24 * 0.02),
    height: 32 / 24,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h3SemiBold = GoogleFonts.inter().copyWith(
    fontSize: 24.sp,
    letterSpacing: -(24 * 0.02),
    height: 32 / 24,
    fontWeight: AppWeightFont.semiBold,
  );

  static TextStyle h3Regular = GoogleFonts.inter().copyWith(
    fontSize: 24.sp,
    letterSpacing: -(24 * 0.02),
    height: 32 / 24,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle h4Bold = GoogleFonts.inter().copyWith(
    fontSize: 20.sp,
    letterSpacing: -(20 * 0.01),
    height: 28 / 20,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h4SemiBold = GoogleFonts.inter().copyWith(
    fontSize: 20.sp,
    letterSpacing: -(20 * 0.01),
    height: 28 / 20,
    fontWeight: AppWeightFont.semiBold,
  );

  static TextStyle h4Regular = GoogleFonts.inter().copyWith(
    fontSize: 20.sp,
    letterSpacing: -(20 * 0.01),
    height: 28 / 20,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle h5Bold = GoogleFonts.inter().copyWith(
    fontSize: 18.sp,
    letterSpacing: -(18 * 0.01),
    height: 26 / 18,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h5SemiBold = GoogleFonts.inter().copyWith(
    fontSize: 18.sp,
    letterSpacing: -(18 * 0.01),
    height: 26 / 18,
    fontWeight: AppWeightFont.semiBold,
  );

  static TextStyle h5Regular = GoogleFonts.inter().copyWith(
    fontSize: 18.sp,
    letterSpacing: -(18 * 0.01),
    height: 26 / 18,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle h6Bold = GoogleFonts.inter().copyWith(
    fontSize: 16.sp,
    letterSpacing: -(16 * 0.01),
    height: 24 / 16,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h6SemiBold = GoogleFonts.inter().copyWith(
    fontSize: 16.sp,
    letterSpacing: -(16 * 0.01),
    height: 24 / 16,
    fontWeight: AppWeightFont.semiBold,
  );

  static TextStyle h6Regular = GoogleFonts.inter().copyWith(
    fontSize: 16.sp,
    letterSpacing: -(16 * 0.01),
    height: 24 / 16,
    fontWeight: AppWeightFont.reguler,
  );
}

class AppWeightFont {
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight bold = FontWeight.w700;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight medium = FontWeight.w500;
  static FontWeight reguler = FontWeight.w400;
  static FontWeight light = FontWeight.w300;
}
