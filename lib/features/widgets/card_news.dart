import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:ragda_news/core/constans/app_icon.dart';
import 'package:ragda_news/utils/date_time.dart';

import '../../core/constans/app_colors.dart';
import '../../core/constans/app_images.dart';
import '../../core/constans/app_text_style.dart';
import '../dashboard/news/data/models/news_model.dart';

class CardNews extends StatelessWidget {
  final String title;
  final NewsSourceModel source;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String published;
  final String content;
  final VoidCallback onTap;

  const CardNews({
    super.key,
    required this.title,
    required this.source,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.published,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final publishedAt = DateTime.parse(published);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              urlToImage,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Image.asset(
                    AppIcons.noImage,
                    height: 50,
                    fit: BoxFit.cover,
                    color: AppColors.black300,
                  ),
                );
              },
            ),
          ),
          const Gap(12),
          Text(
            '${source.name} | ${publishedAt.toEEEddMMYYYY()}',
            style: AppTextStyle.h8Regular.copyWith(color: AppColors.black400),
          ),
          const Gap(8),
          Text(
            title,
            style: AppTextStyle.h4SemiBold.copyWith(color: AppColors.black500),
            maxLines: 3,
          ),
          const Gap(6),
          Text(
            description,
            style: AppTextStyle.h8Regular.copyWith(color: AppColors.black500),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset(AppImages.avatar, fit: BoxFit.cover),
              ),
              const Gap(12),
              Expanded(
                child: Text(
                  author,
                  style: AppTextStyle.h8Regular.copyWith(
                    color: AppColors.black500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Gap(8),
              Text(
                "Read More...",
                style: AppTextStyle.h8SemiBold.copyWith(
                  color: AppColors.primary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
