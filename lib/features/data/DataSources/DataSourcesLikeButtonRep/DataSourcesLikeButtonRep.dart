
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/LikeButton/LikeButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';

abstract class DataSourcesLikeButtonRepository {
  Future<LikeButton> getInitLikeButton(Posts post);
  Future<LikeButton> getLikeButton(Posts post, bool isLiked);

}