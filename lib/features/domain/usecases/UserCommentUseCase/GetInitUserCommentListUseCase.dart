
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/repositories/UserComment_Repository/UserCommentRepository.dart';

class GetInitUserCommentList {
  final UserCommentRepository repository;

  const GetInitUserCommentList({required this.repository});

  Future<List<UserComment>> call(Posts post) async {
    return await repository.getInitUserCommentList(post);
  }
}