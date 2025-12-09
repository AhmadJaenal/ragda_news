import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constans/urls.dart';
import '../../../../../utils/failure.dart';
import '../models/news_model.dart';
import '../repository/news_repository.dart';

class NewsRemoteDatasource implements NewsRepository {
  final _dio = Dio();
  @override
  Future<Either<Failure, List<NewsModel>>> fetchTopNews() async {
    try {
      final response = await _dio.get(Urls.baseUrl + Urls.topNews);
      if (response.statusCode != 200) {
        throw Left(BadRequestFailure(''));
      }

      List<dynamic> jsonList = response.data['articles'];

      final news = NewsModel.fromJsonList(jsonList);
      return Right(news);
    } catch (e) {
      return Left(BadRequestFailure(e.toString()));
    }
  }
}
