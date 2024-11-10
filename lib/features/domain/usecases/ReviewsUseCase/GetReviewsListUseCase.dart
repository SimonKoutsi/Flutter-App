
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/repositories/Reviews_Repository/ReviewsRepository.dart';

class GetReviewsList {
  final ReviewsRepository repository;

  const GetReviewsList({required this.repository});

  Future<List<UserComment>> call(int artistProfileId, String? newReview) async {
    return await repository.getReviewsList(artistProfileId, newReview);
  }
}