// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/FeedPageList/FeedPageList.dart';
import 'package:clean_project/features/domain/repositories/Post_Repository/PostListRepository.dart';

class GetFeedPagePosts {
  final PostListRepository repository;

  const GetFeedPagePosts({required this.repository});

  Future<FeedPageList> call() async {
    return await repository.getFeedPagePosts();
  }
}