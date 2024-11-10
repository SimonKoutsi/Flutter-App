
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesReviewsRep/DataSourcesReviewsRep.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/repositories/Reviews_Repository/ReviewsRepository.dart';

class ReviewsRepositoryImpl implements ReviewsRepository {
  final DataSourcesReviewsRepository dataSources;

  const ReviewsRepositoryImpl({required this.dataSources});

  @override
  Future<List<UserComment>> getInitReviewsList(int artistProfileId) => dataSources.getInitReviewsList(artistProfileId);

  @override
  Future<List<UserComment>> getReviewsList(int artistProfileId, String? newReview) => dataSources.getReviewsList(artistProfileId, newReview);

}