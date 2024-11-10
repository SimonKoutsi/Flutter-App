
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesLikeButtonRep/DataSourcesLikeButtonRep.dart';
import 'package:clean_project/features/domain/entities/LikeButton/LikeButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/repositories/LikeButton_Repository/LikeButtonRepository.dart';

class LikeButtonRepositoryImpl implements LikeButtonRepository {
  final DataSourcesLikeButtonRepository dataSources;

  const LikeButtonRepositoryImpl({required this.dataSources});

  @override
  Future<LikeButton> getInitLikeButton(Posts post) => dataSources.getInitLikeButton(post);

  @override
  Future<LikeButton> getLikeButton(Posts post,bool isLiked) => dataSources.getLikeButton(post, isLiked);

}