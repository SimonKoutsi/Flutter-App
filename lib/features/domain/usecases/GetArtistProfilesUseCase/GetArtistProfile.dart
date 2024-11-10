// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/repositories/ArtistProfile_Repository/ArtistProfile_repository.dart';

class GetArtistProfileUseCase {
  final ArtistProfileRepository repository;

  GetArtistProfileUseCase(this.repository);

  Future<List<ArtistProfile>> call(String query) async {
    return await repository.getArtistProfileSearch(query);
  }
}