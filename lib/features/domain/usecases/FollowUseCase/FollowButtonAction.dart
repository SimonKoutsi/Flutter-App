// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/Follow/Follow.dart';
import 'package:clean_project/features/domain/repositories/Follow_Repository/FollowRepository.dart';

class FollowButtonActiongUseCase {
  final FollowRepository repository;

  const FollowButtonActiongUseCase({required this.repository});

  Future<Follow> call(ArtistProfile artistProfile, bool isfollowing) async {
    return await repository.followButtonAction(artistProfile, isfollowing);
  }
}