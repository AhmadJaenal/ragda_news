import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/news_remote_datasource.dart';
import '../../data/models/news_model.dart';

class NewsViewModel extends GetxController {
  final NewsRemoteDatasource remote;

  NewsViewModel(this.remote);

  var isLoading = false.obs;
  var news = <NewsModel>[].obs;
  String? message;

  @override
  void onInit() {
    super.onInit();
    loadTopNews();
  }

  Future<void> loadTopNews() async {
    isLoading.value = true;
    try {
      (await remote.fetchTopNews()).fold(
        (failure) {
          message = failure.toString();
        },
        (data) {
          news.value = data;
        },
      );

      isLoading.value = false;
    } catch (e) {
      message = e.toString();
      debugPrint("Error fetch top news: ${e.toString()}");
    }
  }
}
