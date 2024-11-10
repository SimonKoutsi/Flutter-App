// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/Follow/Follow.dart';
import 'package:clean_project/features/domain/repositories/Follow_Repository/FollowRepository.dart';

class FollowInitUseCase {
  final FollowRepository repository;

  const FollowInitUseCase({required this.repository});

  Future<Follow> call(ArtistProfile artistProfile) async {
    return await repository.initFollows(artistProfile);
  }
}