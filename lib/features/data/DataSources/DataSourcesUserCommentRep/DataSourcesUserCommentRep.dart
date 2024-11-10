
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';

abstract class DataSourcesUserCommentRepository {
  Future<List<UserComment>> getInitUserCommentList(Posts post);
  Future<List<UserComment>> getUserCommentList(Posts post, String? newComment);
}