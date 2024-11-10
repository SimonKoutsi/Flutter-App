// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/repositories/ArtistProfile_Repository/ArtistProfile_repository.dart';

class GetUsersFollowingListUseCase {
  final ArtistProfileRepository repository;

  GetUsersFollowingListUseCase({required this.repository});

  Future<List<ArtistProfile>> call() async {
    return await repository.getUsersFollowingList();
  }
}