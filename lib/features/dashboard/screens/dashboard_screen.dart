import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/constans/app_colors.dart';
import '../../../core/constans/app_icon.dart';
import '../../../core/constans/app_text_style.dart';
import '../../widgets/app_barchart.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dateController = TextEditingController();
  final List<String> _optionBuilding = [
    'Pilih',
    'Building A',
    'Building B',
    'Building C',
    'Building D',
  ];

  final dateFormat = DateFormat('dd/MM/yyyy');

  final List<String> _optionYears = ['Pilih', '2024', '2023', '2022', '2021'];
  int touchedIndex = -1;
  List<PieChartSectionData> getSections() {
    return [
      PieChartSectionData(
        value: 43,
        title: '43%',
        color: const Color(0xFFFFC6C6),
        radius: 80,
        showTitle: true,
        titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 20,
        title: '20%',
        color: const Color(0xFFFFE2B3),
        radius: 80,
      ),
      PieChartSectionData(
        value: 15,
        title: '15%',
        color: const Color(0xFFBFCDE0),
        radius: 80,
      ),
      PieChartSectionData(
        value: 10,
        title: '10%',
        color: const Color(0xFFB6EAFB),
        radius: 80,
      ),
      PieChartSectionData(
        value: 5,
        title: '5%',
        color: const Color(0xFFD4F6E5),
        radius: 80,
      ),
      PieChartSectionData(
        value: 10,
        title: '10%',
        color: const Color(0xFF4DA3FF),
        radius: 80,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Dashboard',
          style: AppTextStyle.h6SemiBold.copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Corrective (Machine)",
                        style: AppTextStyle.h7SemiBold,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "View All",
                              style: AppTextStyle.h8Regular.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const Gap(6),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppDropdown(
                          option: _optionBuilding,
                          onChanged: (value) {},
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        flex: 1,
                        child: AppDropdown(
                          option: _optionYears,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: PieChart(
                      PieChartData(
                        startDegreeOffset: -90,
                        centerSpaceRadius: 70,
                        sectionsSpace: 4,
                        sections: getSections(),
                        pieTouchData: PieTouchData(),
                      ),
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
            const Gap(12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Trouble by-Area", style: AppTextStyle.h7SemiBold),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: _dateController,
                      readOnly: true,
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
                        prefixIcon: IconButton(
                          icon: Image.asset(AppIcons.calendar),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  content: Container(
                                    width: 350,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: CalendarDatePicker2WithActionButtons(
                                      config:
                                          CalendarDatePicker2WithActionButtonsConfig(
                                            firstDayOfWeek: 1,
                                            calendarType:
                                                CalendarDatePicker2Type.range,
                                            selectedDayTextStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            selectedDayHighlightColor:
                                                AppColors.primary,
                                            centerAlignModePicker: true,
                                            customModePickerIcon: SizedBox(),
                                            firstDate: DateTime.now(),
                                          ),
                                      value: [DateTime.now()],
                                      onValueChanged: (dates) {
                                        DateTime? startDate = dates.isNotEmpty
                                            ? dates[0]
                                            : null;
                                        DateTime? endDate = dates.length > 1
                                            ? dates[1]
                                            : null;

                                        if (startDate != null &&
                                            endDate != null) {
                                          _dateController.text =
                                              "${dateFormat.format(startDate)} - ${dateFormat.format(endDate)}";
                                        } else if (startDate != null) {
                                          _dateController.text = dateFormat
                                              .format(startDate);
                                        } else {
                                          _dateController.text = "";
                                        }
                                      },
                                      onCancelTapped: () {
                                        Get.back();
                                      },
                                      onOkTapped: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),

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
                        hintStyle: AppTextStyle.h7Regular.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 400, child: AppBarChart()),
                ],
              ),
            ),
            const Gap(12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Spare part Usage", style: AppTextStyle.h7SemiBold),

                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "View All",
                              style: AppTextStyle.h8Regular.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const Gap(6),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppDropdown(
                          option: _optionBuilding,
                          onChanged: (value) {},
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        flex: 1,
                        child: AppDropdown(
                          option: _optionYears,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const Gap(8),
                  AppBarchart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
