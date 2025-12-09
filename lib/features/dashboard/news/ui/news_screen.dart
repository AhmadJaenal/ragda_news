import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ragda_news/core/injection.dart';
import 'package:ragda_news/features/dashboard/news/ui/view-model/news_vew_model.dart';
import 'package:ragda_news/routing/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constans/app_colors.dart';
import '../../../../core/constans/app_icon.dart';
import '../../../../core/constans/app_text_style.dart';
import '../../../widgets/card_news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(locator<NewsViewModel>());

    return Scaffold(
      backgroundColor: AppColors.black50,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'News',
          style: AppTextStyle.h6SemiBold.copyWith(color: AppColors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.news.isEmpty) {
            return const Center(child: Text('Tidak ada berita'));
          }

          return ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Breaking News', style: AppTextStyle.h4Bold),
                  Image.asset(AppIcons.search, width: 24),
                ],
              ),
              const Gap(24),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.news.length,
                separatorBuilder: (context, index) => const Gap(24),
                itemBuilder: (context, index) {
                  final item = controller.news[index];

                  return CardNews(
                    title: item.title,
                    author: item.author ?? "",
                    onTap: () {
                      if (item.url != null) {
                        launchUrl(
                          Uri.parse(item.url ?? ""),
                          mode: LaunchMode.inAppWebView,
                        );
                      }
                    },
                    published: item.publishedAt!,
                    content: item.content ?? "",
                    source: item.source,
                    description: item.description ?? "",
                    url: item.url ?? "",
                    urlToImage: item.urlToImage ?? "",
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
