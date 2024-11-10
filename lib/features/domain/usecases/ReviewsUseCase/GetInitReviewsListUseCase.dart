
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/repositories/Reviews_Repository/ReviewsRepository.dart';

class GetInitReviewsList {
  final ReviewsRepository repository;

  const GetInitReviewsList({required this.repository});

  Future<List<UserComment>> call(int artistProfileId) async {
    return await repository.getInitReviewsList(artistProfileId);
  }
}