// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/repositories/Post_Repository/PostListRepository.dart';

class GetLikedPosts {
  final PostListRepository repository;

  const GetLikedPosts({required this.repository});

  Future<LinkedHashSet<Posts>> call() async {
    return await repository.getLikedPosts();
  }
}