
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesUserCommentRep/DataSourcesUserCommentRep.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/repositories/UserComment_Repository/UserCommentRepository.dart';

class UserCommentRepositoryImpl implements UserCommentRepository {
  final DataSourcesUserCommentRepository dataSources;

  const UserCommentRepositoryImpl({required this.dataSources});

  @override
  Future<List<UserComment>> getInitUserCommentList(Posts post) => dataSources.getInitUserCommentList(post);

  @override
  Future<List<UserComment>> getUserCommentList(Posts post, String? newComment) => dataSources.getUserCommentList(post, newComment);

}