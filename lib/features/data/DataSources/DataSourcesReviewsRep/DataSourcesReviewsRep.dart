
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';

abstract class DataSourcesReviewsRepository {
  Future<List<UserComment>> getInitReviewsList(int artistProfileId);
  Future<List<UserComment>> getReviewsList(int artistProfileId, String? newReview);
}