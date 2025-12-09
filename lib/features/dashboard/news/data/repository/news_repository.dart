import 'package:dartz/dartz.dart';
import 'package:ragda_news/features/dashboard/news/data/models/news_model.dart';
import 'package:ragda_news/utils/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsModel>>> fetchTopNews();
}
