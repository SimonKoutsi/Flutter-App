
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/repositories/UserComment_Repository/UserCommentRepository.dart';

class GetUserCommentList {
  final UserCommentRepository repository;

  const GetUserCommentList({required this.repository});

  Future<List<UserComment>> call(Posts post, String? newComment) async {
    return await repository.getUserCommentList(post, newComment);
  }
}