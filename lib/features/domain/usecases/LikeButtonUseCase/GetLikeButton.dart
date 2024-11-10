
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/LikeButton/LikeButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/repositories/LikeButton_Repository/LikeButtonRepository.dart';

class GetLikeButton {
  final LikeButtonRepository repository;

  const GetLikeButton({required this.repository});

  Future<LikeButton> call(Posts post ,bool isLiked) async {
    return await repository.getLikeButton(post, isLiked);
  }
}