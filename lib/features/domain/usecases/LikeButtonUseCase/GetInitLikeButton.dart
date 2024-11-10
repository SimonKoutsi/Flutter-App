
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/LikeButton/LikeButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/repositories/LikeButton_Repository/LikeButtonRepository.dart';

class GetInitLikeButton {
  final LikeButtonRepository repository;

  const GetInitLikeButton({required this.repository});

  Future<LikeButton> call(Posts post) async {
    return await repository.getInitLikeButton(post);
  }
}